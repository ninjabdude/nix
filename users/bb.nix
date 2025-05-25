{
  homeDirectory,
  username,
}: {pkgs, ...}: {
  home.homeDirectory = homeDirectory;
  home.username = username;
  home.packages = with pkgs; [neofetch];
  home.stateVersion = "24.11";
}
