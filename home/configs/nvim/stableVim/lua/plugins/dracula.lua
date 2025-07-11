return {
    "dracula.nvim",
    enabled = true,
    after = function()
	require("dracula").setup({
	    colors = {
		bg = "#000000",
	    },
	    overrides = {
		['@boolean'] = { fg = "orange"},
	    },
	})
	vim.cmd("colorscheme dracula-soft")
	vim.api.nvim_set_hl(0, "MatchParen", { bg = "#a688ff", fg = "#000000", bold = true, })
    end,
}
