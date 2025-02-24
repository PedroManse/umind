dir: with builtins; let
	progs_names = attrNames (readDir dir);
	progs_vals = map (fl: {
		name = replaceStrings [".nix"] [""] fl;
		value = import (dir + ("/"+fl));
	}) (progs_names);
in listToAttrs progs_vals
