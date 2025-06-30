{config,lib,pkgs,homeLib, ...}:{


    home.file."${homeLib.homeDirectory}/.config/tmux/custom".source = 
	homeLib.mkSource {
	    source = "${homeLib.homeDirectory}/nix/home/configs/tmux/custom"; 
	    inherit lib config;
	};
    programs.tmux = {
	enable = true;
	extraConfig = "source-file ${homeLib.homeDirectory}/.config/tmux/custom/tmux.conf";
	plugins = with pkgs; [
	    tmuxPlugins.vim-tmux-navigator
	];
    };
    programs.sesh = {
	enable = true;
	enableTmuxIntegration = true;
	settings = {
	    default_session = {
		startup_command = "tmux neww -dn scratch ; tmux renamew nvim ; vim .";
	    };
	};
    };
}
