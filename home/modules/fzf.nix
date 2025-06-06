{config,lib,pkgs,homeLib, ...}:{

    programs.fzf = {
	enable = true;
	enableZshIntegration = true;
	tmux.enableShellIntegration = true;
    };

}
