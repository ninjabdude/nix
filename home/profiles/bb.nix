{config, lib, pkgs, homeOptions, ...}: {
    home.homeDirectory = homeOptions.homeDirectory;
    home.username = homeOptions.username;
    home.packages = with pkgs; [fastfetch home-manager tmux];
    home.stateVersion = "24.11";



    # editMode = true;
    home.file."${config.home.homeDirectory}/.config/tmux/tmux.conf".source =  
	# config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/modules/tmux/tmux.conf";
	"${config.home.homeDirectory}/nix/home/modules/tmux/tmux.conf";
}
