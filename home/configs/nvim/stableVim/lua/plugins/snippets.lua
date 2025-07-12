return {
    {
        "luasnip",
    },
    {
        "nvim-scissors",
        after = function()
            require("scissors").setup({
                jsonFormatter = "jq",
            }) --nolint 

            vim.keymap.set("n", "<leader>xe", function()
                require("scissors").editSnippet()
            end, { desc = "Snippet: Edit" })

            -- when used in visual mode, prefills the selection as snippet body
            vim.keymap.set({ "n", "x" }, "<leader>xa", function()
                require("scissors").addNewSnippet()
            end, { desc = "Snippet: Add" })
        end,
    },
}
