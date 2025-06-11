{config,lib,pkgs,homeLib, ...}:{

    programs.zoxide = {
	enable = true;
	enableZshIntegration = true;
	options = [ "--cmd cd" ];
    };

}
