return { -- Useful plugin to show you pending keybinds.
    "which-key.nvim",
    event = "DeferredUIEnter",
    after =  function ()
	-- require("which-key").setup({}) 
	require("which-key").add({
 		{ "<leader>c", group = "[C]ode" },
		{ "<leader>c_", hidden = true },
		{ "<leader>d", group = "[D]ocument" },
		{ "<leader>r", group = "[R]ename" },
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>s_", hidden = true },
		{ "<leader>w", group = "[W]orkspace" },
		{ "<leader>t", group = "[T]oggle" },
		{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		{ "s", group = "s" },
		{ "gc", group = "[C]omment" },
	    })
	end,
}
