{config,lib,pkgs,homeLib, ...}:{

    home.packages = [pkgs.tmux];

    home.file."${homeLib.homeDirectory}/.config/tmux/custom.conf".source = 
	homeLib.mkSource {
	    source = "${homeLib.homeDirectory}/nix/home/modules/tmux/tmux.conf"; 
	    inherit lib config;
	};
    programs.tmux.enable = true;
    programs.tmux.extraConfig = "source-file ${homeLib.homeDirectory}/.config/tmux/custom.conf";
}
