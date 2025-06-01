{config,lib,pkgs,homeLib, ...}:{

    home.packages = [pkgs.tmux];

    home.file."${homeLib.homeDirectory}/.config/tmux/tmux.conf".source = 
	homeLib.sourceFile {
	    source = "${homeLib.homeDirectory}/nix/home/modules/tmux/tmux.conf"; 
	    inherit lib;
	};
}
