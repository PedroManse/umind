#cfg@{enable?true, ...}: let 
#  pkgs = import <nixpkgs> {};
#  lib = pkgs.lib;
#in
#lib.recursiveUpdate {
#	inherit enable;
#	settings = {
#		font = {
#			normal.family = "mononoki";
#			size = 9.6;
#		};
#		colors.primary.background = "#000000";
#		mouse.hide_when_typing = true;
#		general.live_config_reload = true;
#	};
#} cfg

cfg@{enable?true, ...}: let 
in
{
	inherit enable;
	settings = {
		font = {
			normal.family = "mononoki";
			size = 9.6;
		};
		colors.primary.background = "#000000";
		mouse.hide_when_typing = true;
		general.live_config_reload = true;
	};
}//cfg
