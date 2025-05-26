{
  homeDirectory,
  username,
}: {pkgs, ...}: {
  home.homeDirectory = homeDirectory;
  home.username = username;
  home.packages = with pkgs; [fastfetch];
  home.stateVersion = "24.11";
}
