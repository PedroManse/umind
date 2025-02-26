let
	p = import ./autoprogs.nix ./progs;
in
{
	home-manager.users.manse = {
		programs = {
			git = p.git {};
			alacritty = p.alacritty{
				settings.font.size = 3;
			};
			x = p.uwu{};

			bat.enable = true;
			eza = {
				enable = true;
				colors = "always";
				git = true;
			};
			gh.enable = true;

			waybar.enable = true;
			wofi = {
				enable = true;
				settings = {
					allow_images=true;
					key_expand="Right";
				};
			};
			direnv = {
				enable = true;
				enableBashIntegration = true;
				nix-direnv.enable = true;
			};

			neovim = {
				enable = true;
				defaultEditor = true;
			};


			bash = {
				enable = true;
				bashrcExtra = ''
					. ~/dots/bashrc
				'';
			};
		};
	};
}

