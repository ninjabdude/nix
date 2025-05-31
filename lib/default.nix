{inputs}:
let
    defaultUsername = "bb";
    
    defaultHomePath = "/home";

    impureSystem = builtins.currentSystem; #must use with --impure flag 

    defaultProfile = "bb";
in 
{
    mkHomeManager = {
	system ? impureSystem,
	username ? defaultUsername,
	homeProfile ? defaultProfile, 
    }: 
    let
	homeDirectory =
	    if system == "aarch64-darwin" || system == "x86_64-darwin"
	    then "/Users/${username}"
	    else "${defaultHomePath}/${username}";
    in
	inputs.home-manager.lib.homeManagerConfiguration {
	   pkgs = inputs.nixpkgs.legacyPackages.${system};
	   modules = [(import ../home/profiles/${homeProfile}.nix { inherit homeDirectory username system; })]; 
	};


}
