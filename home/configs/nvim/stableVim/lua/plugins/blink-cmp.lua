return {
    "blink.cmp",
    after = function()
	require("blink.cmp").setup{
	    keymap = {preset = 'default'},
	}
    end,
}
