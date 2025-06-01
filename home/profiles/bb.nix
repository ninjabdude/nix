{config, lib, pkgs, homeLib, ...}: {
    home.stateVersion = "24.11";
    home.homeDirectory = homeLib.homeDirectory;
    home.username = homeLib.username;

    home.packages = with pkgs; [home-manager fastfetch];

    imports = [
	../modules/tmux/tmux.nix			
    ];


}
