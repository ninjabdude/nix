-- lua/custom/plugins/mini.lua
return {
    {
        'mini.nvim',
        after = function()
	    require("mini.statusline").setup({ use_icons = true })

		--    require("mini.base16").setup({
		-- palette = {
		--     base00 = '#000000',
		--     base01 = '#202020',
		--     base02 = '#303030',
		--     base03 = '#505050',
		--     base04 = '#b0b0b0',
		--     base05 = '#d0d0d0',
		--     base06 = '#e0e0e0',
		--     base07 = '#ffffff',
		--     base08 = '#f5708a',
		--     base09 = '#ee8122',
		--     base0A = '#b8a300',
		--     base0B = '#54bc5c',
		--     base0C = '#00bab3',
		--     base0D = '#00aff2',
		--     base0E = '#9095ff',
		--     base0F = '#d47ada'
		-- }
		--    })
	end,
    }
}
