{config,lib,pkgs,homeLib, ...}:{


    home.file."${homeLib.homeDirectory}/.config/tmux/custom.conf".source = 
	homeLib.mkSource {
	    source = "${homeLib.homeDirectory}/nix/home/modules/tmux/tmux.conf"; 
	    inherit lib config;
	};
    programs.tmux = {
	enable = true;
	extraConfig = "source-file ${homeLib.homeDirectory}/.config/tmux/custom.conf";
    };
}
