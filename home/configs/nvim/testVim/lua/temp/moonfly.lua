return{
	{
	  "vim-moonfly-colors",
	  enabled = true,
	  lazy = false,
	  priority = 1000,
	  after = function()
	      require("moonfly").palette({
		  grey0 = "#44475a",
	      })
	      vim.cmd [[colorscheme moonfly]]

	      -- vim.api.nvim_set_hl(0, "Visual", { bg = "#44475a" })

	      vim.api.nvim_set_hl(0, "MatchParen", { bg = "#a688ff", fg = "#000000", bold = true })
	  end,
      },
  }
