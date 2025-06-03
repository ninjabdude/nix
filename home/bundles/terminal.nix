{config,lib,pkgs,homeLib, ...}:{

    imports = [
	../modules/tmux/tmux.nix			
	../modules/zsh/zsh.nix
	../modules/starship.nix
	../modules/zoxide.nix
	../modules/fzf.nix
    ];
}
