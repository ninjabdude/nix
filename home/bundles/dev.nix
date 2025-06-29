{config,lib,pkgs,homeLib, ...}:{

    imports = [
	../configs/tmux/tmux.nix			
	../configs/zsh/zsh.nix
	../configs/starship.nix
	../configs/fzf.nix
	../configs/zoxide.nix
	# ../configs/sesh.nix
	# ../configs/ghostty/ghostty.nix
	../configs/wezterm/wezterm.nix
	../configs/nvim/nvim.nix
    ];
}
