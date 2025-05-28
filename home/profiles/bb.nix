{
    homeDirectory,
	username,
	system,
}: {config, lib, pkgs, ...}: {
    home.homeDirectory = homeDirectory;
    home.username = username;
    home.packages = with pkgs; [fastfetch home-manager tmux];
    home.stateVersion = "24.11";



    # editMode = true;
    home.file."${config.home.homeDirectory}/.config/tmux/tmux.conf".source = 
	config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/modules/tmux/tmux.conf";
}
