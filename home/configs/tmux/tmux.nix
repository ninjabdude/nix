{config,lib,pkgs,homeLib, ...}:{


    home.file."${homeLib.homeDirectory}/.config/tmux/custom".source = 
	homeLib.mkSource {
	    source = "${homeLib.homeDirectory}/nix/home/configs/tmux/custom"; 
	    inherit lib config;
	};
    xdg.configFile = {
	"tmux/plugins/tmux-which-key/config.yaml".text = lib.generators.toYAML {} {
	    command_alias_start_index = 200;
	    # rest of config here
	};
    };
    programs.tmux = {
	enable = true;
	extraConfig = "source-file ${homeLib.homeDirectory}/.config/tmux/custom/tmux.conf";
	plugins = with pkgs; [
	    {
		plugin = tmuxPlugins.tmux-which-key;
		extraConfig = ''
		    set -g @tmux-which-key-xdg-enable 1;
		'';
	    }
	];
    };
    programs.sesh = {
	enable = true;
	enableTmuxIntegration = true;
    };


}
