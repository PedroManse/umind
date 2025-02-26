with builtins; let
  hasSuffix =
    suffix:
    content:
    let
      lenContent = stringLength content;
      lenSuffix = stringLength suffix;
    in
			lenContent >= lenSuffix && substring (lenContent - lenSuffix) lenContent content == suffix;
	files_names = attrNames ( readDir ./. );
	progs_names = filter (fl: hasSuffix ".nix" fl) (files_names);
	progs_names_not_repl = filter (fl: fl != "repl.nix") (progs_names);
	progs_vals = map (fl: {
		name = replaceStrings [".nix"] [""] fl;
		value = import (./. + ("/"+fl));
	}) (progs_names_not_repl);
in listToAttrs progs_vals
