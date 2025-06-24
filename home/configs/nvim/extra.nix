{config,lib,pkgs,homeLib, ...}:{

# testVim
    home.file."${homeLib.homeDirectory}/.config/testVim".source = 
	homeLib.mkSource {
	    source = "${homeLib.homeDirectory}/nix/home/configs/nvim/testVim"; 
	    inherit lib config;
	};
# stableVim
    home.file."${homeLib.homeDirectory}/.config/stableVim".source = 
	homeLib.mkSource {
	    source = "${homeLib.homeDirectory}/nix/home/configs/nvim/stableVim"; 
	    inherit lib config;
	};


    home.packages = with pkgs; [
	git
	curl
	gcc
	lua
	go
    ];

    programs.go.enable = true;

			       }
