return {
    "dracula.nvim",
    enabled = true,
    after = function()
        require("dracula").setup({
            colors = {
                bg = "#000000",
            },
            overrides = {
                ["@boolean"] = { fg = "orange" },
            },
        })
        vim.cmd("colorscheme dracula-soft")
        vim.api.nvim_set_hl(0, "MatchParen", { bg = "#a688ff", fg = "#000000", bold = true })
        vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1c1c1c" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1c1c1c" })
	vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#DD6E6B" })
	vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#E48CC1" })
    end,
}
