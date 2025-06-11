{config,lib,pkgs,homeLib, ...}:{

    home.file."${homeLib.homeDirectory}/.config/wezterm/".source = 
	homeLib.mkSource {
	    source = "${homeLib.homeDirectory}/nix/home/configs/wezterm/config/"; 
	    inherit lib config;
	};

   programs.wezterm = {
       enable = true;
       enableZshIntegration = true;
   };
}
