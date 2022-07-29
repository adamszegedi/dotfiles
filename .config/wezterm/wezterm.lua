
local wezterm = require("wezterm")
local catppuccin = require("colors/catppuccin").setup {
	-- whether or not to sync with the system's theme
	sync = true,
	-- the flavours to switch between when syncing
	-- available flavours: "latte" | "frappe" | "macchiato" | "mocha"
	sync_flavours = {
		light = "latte",
		dark = "mocha"
	},
	-- the default/fallback flavour, when syncing is disabled
	flavour = "mocha"
}


return {
	font = wezterm.font 'JetBrains Mono',
	font_size = 16,
	colors = catppuccin,
}
