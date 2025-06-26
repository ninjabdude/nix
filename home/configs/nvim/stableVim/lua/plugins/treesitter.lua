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
	require('treesitter-context').setup{}
	vim.api.nvim_set_hl(0,'TreesitterContext',{bg = '#1C1C1C',} )
	vim.api.nvim_set_hl(0,'TreesitterContextLineNumber',{fg = '#1C1C1C',bg = '#BAA0E8',} )
    end,
}
