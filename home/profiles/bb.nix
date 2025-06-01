{config, lib, pkgs, homeLib, ...}: {
    home.homeDirectory = homeLib.homeDirectory;
    home.username = homeLib.username;
    home.packages = with pkgs; [fastfetch home-manager tmux];
    home.stateVersion = "24.11";

    home.file."${homeLib.homeDirectory}/.config/tmux/tmux.conf".source = 
	homeLib.sourceFile {
	    source = "${homeLib.homeDirectory}/nix/home/modules/tmux/tmux.conf"; 
	    inherit lib;
	};
				   }
