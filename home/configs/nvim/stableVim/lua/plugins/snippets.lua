return {
    {
        "luasnip",
        after = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" }
            })
        end,
    },
    {
        "nvim-scissors",
        after = function()
            require("scissors").setup({
                snippetDir = vim.fn.stdpath("config") .. "/snippets",
                jsonFormatter = "jq",
            })

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
