#!/bin/bash
set -e

mkdir "$1-dumps"
grep rw-p /proc/$1/maps \
	| sed -n 's/^\([0-9a-f]*\)-\([0-9a-f]*\) .*$/\1 \2/p' \
	| while read start stop; do \
		gdb -q --batch --pid $1 -ex \
		"dump memory $1-dumps/$start-$stop.dump 0x$start 0x$stop"; \
	done
tar --no-auto-compress -c "$1-dumps" -f "$1.dump.tar"
