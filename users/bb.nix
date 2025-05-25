{
    homeDirectory,
    username,
}: {pkgs, ...}:
{
    home = {
	stateVersion = "24.05";
	inherit username;
	inherit homeDirectory;
	packages = {pkgs.neofetch pkgs.home-manager};
    };
}
