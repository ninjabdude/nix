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
	editMode ? true,
	# homeSetup ? "standalone",
    }: 
    let
    homeLib = rec{
	inherit 
	    system
	    username
	    editMode
	    homeProfile;

	homeDirectory =
	    if system == "aarch64-darwin" || system == "x86_64-darwin"
		then "/Users/${username}"
	    else "${defaultHomePath}/${username}";

	symlinkFile =let inherit editMode; in{source, config, lib, }:  
	if editMode
	then config.lib.file.mkOutOfStoreSymlink source
	else source;
    };

    in
	inputs.home-manager.lib.homeManagerConfiguration {
	   pkgs = inputs.nixpkgs.legacyPackages.${system};
	   modules = [(import ../home/profiles/${homeProfile}.nix )]; 
	   extraSpecialArgs = {inherit homeLib;};
	};


}
