{
  homeDirectory,
  username,
  system,
}: {pkgs, ...}: {
  home.homeDirectory = homeDirectory;
  home.username = username;
  home.packages = with pkgs; [fastfetch home-manager];
  home.stateVersion = "24.11";
}
