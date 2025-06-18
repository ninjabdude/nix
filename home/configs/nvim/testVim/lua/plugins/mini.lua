-- lua/custom/plugins/mini.lua
return {
    {
        'mini.nvim',
        after = function()
	    require("mini.statusline").setup({ use_icons = true })
	end,
    }
}
