{config, lib, pkgs, homeLib, ...}: {
    home.homeDirectory = homeLib.homeDirectory;
    home.username = homeLib.username;
    home.packages = with pkgs; [fastfetch home-manager tmux];
    home.stateVersion = "24.11";


    home.file = {
 
# make a funciton that will be called like home.file = fucntion,
# this function will be called sourceConfigFile and take the args {editMode sourcePath targetPath}
# then will either mkoutofstoresymlink or not

	"${config.home.homeDirectory}/.config/tmux/tmux.conf".source =  
	# config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/modules/tmux/tmux.conf";
	"${config.home.homeDirectory}/nix/home/modules/tmux/tmux.conf";
	};
}
