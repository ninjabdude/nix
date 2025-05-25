{inputs}:
let
    defaultUsername = "bb";
    
    defaultHomePath = "/home";
in 
{
    mkHomeManager = {
	system,
	username ? defaultUsername,
    }: 
    let
	homeDirectory =
	    if system == "aarch64-darwin" || system == "x86_64-darwin"
	    then "/Users/${username}"
	    else "${defaultHomePath}/${username}";
    in
	inputs.home-manager.lib.homeManagerConfiguration {
	   pkgs = inputs.nixpkgs.legacyPackages.${system};
	   modules = [import ../users/bb.nix {inherit homeDirectory username;}]; 
	};


}
