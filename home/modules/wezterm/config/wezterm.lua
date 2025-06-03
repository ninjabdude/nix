-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
--===============================================================

-- Color Schemes:
--config.color_scheme = 'Japanesque (Gogh)' --https://github.com/Gogh-Co/Gogh/blob/master/themes/Japanesque.yml
--config.color_scheme = 'Whimsy'
--config.color_scheme = 'nord'
--config.color_scheme = 'Catppuccin Mocha'
--config.color_scheme = 'Neutron'
--config.color_scheme = 'nordfox'
--config.color_scheme = 'Kanagawa (Gogh)'
config.color_scheme = "NvimDark"

--Fixing 'Japanesque (Gogh)' cursor text color
--config.colors = {cursor_fg = '#1E1E1E'}

--Fonts:
config.font_size = 20
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Symbols Nerd Font Mono",
})
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

--===============================================================

return config
