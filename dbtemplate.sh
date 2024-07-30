set -e
read -e -p "DB name>" DB_NAME
read -e -p "USER name>" DB_USER
read -e -s -p "USER password>" DB_PASS
read -e -p "Is only consumer (won't alter schema) [y/N]>" -n 1 DB_CONSUMER 

CONSUMER_SCRIPT="""
CREATE USER \"$DB_USER\" WITH ENCRYPTED PASSWORD '$DB_PASS';
CREATE DATABASE \"$DB_NAME\" TEMPLATE 'template0' ENCODING 'UTF-8' OWNER \"$DB_USER\";
GRANT pg_read_all_data TO \"$DB_USER\";
GRANT pg_write_all_data TO \"$DB_USER\";
"""

USER_SCRIPT="""
ALTER USER \"$DB_USER\" CREATEDB;
GRANT USAGE ON ALL FUNCTIONS IN SCHEMA 'public' TO \"$DB_USER\";
GRANT USAGE ON ALL PROCEDURES IN SCHEMA 'public' TO \"$DB_USER\";
GRANT USAGE ON ALL ROUTINES IN SCHEMA 'public' TO \"$DB_USER\";
GRANT USAGE ON ALL SEQUENCES IN SCHEMA 'public' TO \"$DB_USER\";
GRANT USAGE ON ALL TABLES IN SCHEMA 'public' TO \"$DB_USER\";
GRANT USAGE ON SCHEMA 'public' TO \"$DB_USER\";
GRANT USAGE ON DATABASE \"$DB_NAME\" TO \"$DB_USER\";
"""

echo """${CONSUMER_SCRIPT}"""
if [[ ! $DB_CONSUMER == "y" ]] ; then
	echo """${USER_SCRIPT}"""
fi


