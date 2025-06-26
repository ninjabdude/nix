return {
    "lazydev.nvim",
    ft = "lua",
    after = function() 
	require("lazydev.Config").setup({
	    library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	    },
	})

    end,
}
