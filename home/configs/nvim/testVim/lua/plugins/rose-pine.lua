return {
    "rose-pine",
    enabled = false,
    after = function()
	require("rose-pine").setup({
	})
	vim.cmd("colorscheme rose-pine")
    end,
}
