{config,lib,pkgs,homeLib, ...}:{

    imports = [
	../modules/tmux/tmux.nix			
	../modules/zsh/zsh.nix
	../modules/starship.nix
	../modules/fzf.nix
	../modules/zoxide.nix
	../modules/sesh.nix
	# ../modules/ghostty/ghostty.nix
	../modules/wezterm/wezterm.nix
    ];
}
