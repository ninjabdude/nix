
{config,lib,pkgs,homeLib, ...}:{
	#
	#    home.file."${homeLib.homeDirectory}/.config/ghostty/".source = 
	# homeLib.mkSource {
	#     source = "${homeLib.homeDirectory}/nix/home/modules/ghostty/config/"; 
	#     inherit lib config;
	# };

    # home.packages = [pkgs.ghostty];

#    programs.ghostty = {
#        enable = true;
#
#        settings = {
# 	   config-file = ./config/custom;
#        };
#    };
}
