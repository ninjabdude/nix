{ config, lib, homeLib, ... }: let
    inputs = homeLib.inputs;
    utils = inputs.nixCats.utils;
in {
    imports = [
	./extra.nix
	inputs.nixCats.homeModule
    ];
    config = {
	# this value, nixCats is the defaultPackageName you pass to mkNixosModules
	# it will be the namespace for your options.
	nixCats = {
	    enable = true;
	    # nixpkgs_version = inputs.nixpkgs;
	    # this will add the overlays from ./overlays and also,
	    # add any plugins in inputs named "plugins-pluginName" to pkgs.neovimPlugins
	    # It will not apply to overall system, just nixCats.
	    addOverlays = /* (import ./overlays inputs) ++ */ [
		(utils.standardPluginOverlay inputs)
	    ];
	    # see the packageDefinitions below.
	    # This says which of those to install.
	    packageNames = [ "stable" "test"];

	    luaPath = ./.;

	    # the .replace vs .merge options are for modules based on existing configurations,
	    # they refer to how multiple categoryDefinitions get merged together by the module.
	    # for useage of this section, refer to :h nixCats.flake.outputs.categories
	    categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
		# to define and use a new category, simply add a new list to a set here,
		# and later, you will include categoryname = true; in the set you
		# provide when you build the package using this builder function.
		# see :help nixCats.flake.outputs.packageDefinitions for info on that section.

		# lspsAndRuntimeDeps:
		# this section is for dependencies that should be available
		# at RUN TIME for plugins. Will be available to PATH within neovim terminal
		# this includes LSPs
		lspsAndRuntimeDeps = {
		    general = with pkgs; [
			lazygit 
			gopls
			delve
			golint
			golangci-lint
			gotools
			go-tools
			go
			nixd
			alejandra
			lua-language-server
			stylua
		    ];
		};

		# This is for plugins that will load at startup without using packadd:
		startupPlugins = {
		    general = with pkgs.vimPlugins; [
			lz-n

			plenary-nvim
			telescope-fzf-native-nvim
			telescope-ui-select-nvim
			nvim-web-devicons
			friendly-snippets
			nvim-treesitter-context

		    ];
		};

		# not loaded automatically at startup.
		# use with packadd and an autocommand in config to achieve lazy loading
		optionalPlugins = {
		    general = with pkgs.vimPlugins; [
			lazydev-nvim
			mini-nvim
			gitsigns-nvim
			undotree
			which-key-nvim
			oil-nvim
			mini-nvim
			dracula-nvim 
			telescope-nvim
			nvim-treesitter.withAllGrammars
			blink-cmp
		    ];
		    vimExtras = with pkgs; [
		    ];
		};
	    });

	    # see :help nixCats.flake.outputs.packageDefinitions
	    packageDefinitions.replace = {
		# These are the names of your packages
		# you can include as many as you wish.
		stable = {pkgs, name, ... }: {
		    # they contain a settings set defined above
		    # see :help nixCats.flake.outputs.settings
		    settings = {
			wrapRc = false;
			unwrappedCfgPath = "${homeLib.homeDirectory}/.config/stableVim";
			configDirName = "stableVim";
			# IMPORTANT:
			# your alias may not conflict with your other packages.
			aliases = [ "stableVim" "svim" ];
			# neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
			hosts.python3.enable = true;
			hosts.node.enable = true;
		    };
		    # and a set of categories that you want
		    # (and other information to pass to lua)
		    # and a set of categories that you want
		    categories = {
			general = true;
			vimExtras = true;
		    };
		    # anything else to pass and grab in lua with `nixCats.extra`
		    extra = {
			nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
		    };
		};

		test = {pkgs, name, ... }: {
		    # they contain a settings set defined above
		    # see :help nixCats.flake.outputs.settings
		    settings = {
			wrapRc = false;
			unwrappedCfgPath = "${homeLib.homeDirectory}/.config/testVim";
			configDirName = "testVim";
			# IMPORTANT:
			# your alias may not conflict with your other packages.
			aliases = [ "testVim" "tvim"];
			# neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
			hosts.python3.enable = true;
			hosts.node.enable = true;
		    };
		    # and a set of categories that you want
		    # (and other information to pass to lua)
		    # and a set of categories that you want
		    categories = {
			general = true;
			vimExtras = true;
		    };
		    # anything else to pass and grab in lua with `nixCats.extra`
		    extra = {
			nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
		    };
		};

	    };
	};
    }; 
}
