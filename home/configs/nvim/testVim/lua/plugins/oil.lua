return {
    {
	'oil.nvim',
	lazy = false,
	after = function()
	    require("oil").setup({
		view_options = {
		    show_hidden = true,
		},
		keymaps = {
		    ["<leader>n"] = {"actions.close", mode = "n"},
		},
	    })
	    vim.keymap.set('n', '<leader>n', function()
		vim.cmd((vim.bo.filetype == 'oil') and 'bd' or 'Oil')
	    end,{desc = "[N]avigate files"})
	end,

	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.

		-- vim.keymap.set("n","<leader>n","<CMD>Oil<CR>", {desc = "[N]avigate files"}),

    }
}
