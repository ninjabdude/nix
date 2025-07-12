return {
    "blink.cmp",
    after = function()
        require("blink.cmp").setup({
            keymap = { preset = "default" },
            sources = {
                providers = {
                    snippets = {
                        opts = {
                            search_paths = { vim.fn.stdpath("config") .. "/snippets" },
                        },
                    },
                },
            },
        })
        vim.keymap.set("n", "<leader>xr", function()
            require("blink.cmp").reload()
            vim.notify("blink.cmp snippets reloaded", vim.log.levels.INFO)
        end, { desc = "Reload blink.cmp snippets" })
    end,
}
