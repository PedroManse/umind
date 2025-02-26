let
	inherit (builtins) genList toString;
in
map (n: "SUPER, ${toString n}, workspace, ${toString n}") ( genList (n: n+1) 9 )
