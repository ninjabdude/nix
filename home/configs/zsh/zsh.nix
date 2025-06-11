{config,lib,pkgs,homeLib, ...}:{

    home.file."${homeLib.homeDirectory}/.config/zsh/".source = 
	homeLib.mkSource {
	    source = "${homeLib.homeDirectory}/nix/home/configs/zsh/config/"; 
	    inherit lib config;
	};

   programs.zsh = {
       enable = true;
       syntaxHighlighting.enable = true;
       
       initContent = "source ${homeLib.homeDirectory}/.config/zsh/custom.zsh";
   };
}
