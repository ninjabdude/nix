return {
    "nvim-treesitter",
    lazy = false,
    after = function()
	require("nvim-treesitter.configs").setup{
	    auto_install = false,
	    ensure_installed = {},
	    highlight = { enable = true },
	    ignore_install = {},
	    indent = { enable = true },
	    modules = {},
	    sync_install = false,
	}
    end,
}
