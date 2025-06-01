{config, lib, pkgs, homeLib, ...}: {
    home.homeDirectory = homeLib.homeDirectory;
    home.username = homeLib.username;
    home.packages = with pkgs; [fastfetch home-manager tmux];
    home.stateVersion = "24.11";

	#    sourceConfigFile = {editMode, targetPath, sourcePath}: 
	# "${config.home.homeDirectory}/${targetPath}".source =  
	# if editMode == true 
	#     then config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/${sourcePath}"
	# else "${config.home.homeDirectory}/${sourcePath}"
    home.file."${homeLib.homeDirectory}/.config/tmux/tmux.conf".source = 
	homeLib.sourceFile {
	    source = "${homeLib.homeDirectory}/nix/home/modules/tmux/tmux.conf"; 
	    inherit lib config;
	};

# make a funciton that will be called like home.file = fucntion,
# this function will be called sourceConfigFile and take the args {editMode sourcePath targetPath}
# then will either mkoutofstoresymlink or not

	# "${config.home.homeDirectory}/.config/tmux/tmux.conf".source =  
	# config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/modules/tmux/tmux.conf";
	# "${config.home.homeDirectory}/nix/home/modules/tmux/tmux.conf";
}
