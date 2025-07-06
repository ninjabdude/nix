{
  config,
  lib,
  pkgs,
  homeLib,
  ...
}: {

    programs.direnv = {
	enable = true;
	enableZshIntegration = true;
	nix-direnv.enable = true;
    }; 
}
