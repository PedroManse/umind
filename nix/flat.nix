let
	inherit (builtins) map concatLists;
	flatMap = f: xs: concatLists (map f xs);
in
	flatMap ({key, direction}: [
				"CRTL ALT, ${key}, movewindow, ${direction}"
				"SHIFT ALT, ${key}, movefocus, ${direction}"
			]) [
				{key = "h"; direction="left";}
				{key = "j"; direction="down";}
				{key = "k"; direction="up";}
				{key = "l"; direction="right";}
			]
