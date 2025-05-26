{
  homeDirectory,
  username,
}: {pkgs, ...}: {
  home.homeDirectory = homeDirectory;
  home.username = username;
  home.packages = with pkgs; [neofetch home-manager];
  home.stateVersion = "24.11";
}
