{pkgs, homeLib, ...}: {
  home.homeDirectory = homeLib.homeDirectory;
  home.username = homeLib.username;
  home.packages = with pkgs; [neofetch home-manager];
  home.stateVersion = "24.11";
}
