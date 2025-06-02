{config,lib,pkgs,homeLib, ...}:{

    home.packages = [pkgs.zsh];

    home.file."${homeLib.homeDirectory}/.config/zsh/".source = 
	homeLib.mkSource {
	    source = "${homeLib.homeDirectory}/nix/home/modules/zsh/config/"; 
	    inherit lib config;
	};

   programs.zsh = {
       enable = true;
       
       initContent = "source ${homeLib.homeDirectory}/.config/zsh/custom.zsh";
   };

}
