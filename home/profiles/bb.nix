{config, lib, pkgs, homeLib, ...}: {
    home.stateVersion = "25.05";
    home.homeDirectory = homeLib.homeDirectory;
    home.username = homeLib.username;

    home.packages = with pkgs; [home-manager fastfetch];

    imports = [
	../bundles/terminal.nix
    ];


}
