{config,lib,pkgs,homeLib, ...}:{

    programs.sesh = {
	enable = true;
	enableTmuxIntegration = true;
    };

}
