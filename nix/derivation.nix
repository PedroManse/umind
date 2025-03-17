let
in
derivation {
	name = "sr-rs";
	system = "x86_64-linux";
	#builder = "${pkgs.cargo}/bin/cargo";
	builder = "cargo";
	args = ["build" "--release"];
	out = ["out"];
}
