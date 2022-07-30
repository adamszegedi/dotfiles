
local wezterm = require("wezterm")
local catppuccin = require("colors/catppuccin").setup {}

return {
	font = wezterm.font 'JetBrains Mono',
	font_size = 16,
	colors = catpuccin,
	enable_tab_bar = false,
}
