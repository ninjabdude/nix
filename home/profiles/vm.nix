{pkgs, homeOptions, ...}: {
  home.homeDirectory = homeOptions.homeDirectory;
  home.username = homeOptions.username;
  home.packages = with pkgs; [neofetch home-manager];
  home.stateVersion = "24.11";
}
