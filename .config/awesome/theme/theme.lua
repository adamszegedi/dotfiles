local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme = dofile(themes_path .. "default/theme.lua")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("helpers")
local icons = require("icons")

-- ################################
-- GENERAL CONFIGS
-- ################################
--- Gaps
theme.useless_gap = dpi(3)
theme.border_width = dpi(2)
awesome.set_preferred_icon_size(64)

--- Ui Fonts
theme.font_name = "JetBrainsMono Nerd Font"
theme.font = theme.font_name .. " 13"

--- Icon Fonts
theme.icon_font = "Material Icons "

--- ░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀
--- ░█░░░█░█░█░░░█░█░█▀▄░▀▀█
--- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀


theme.rosewater = "#F4DBD6"
theme.flamingo = "#F0C6C6"
theme.pink = "#F5BDE6"
theme.mauve = "#C6A0F6"
theme.red = "#ED8796"
theme.maroon = "#EE99A0"
theme.peach = "#F5A97F"
theme.yellow = "#EED49F"
theme.green = "#A6DA95"
theme.eal = "#8BD5CA"
theme.sky = "#91D7E3"
theme.sapphire = "#7DC4E4"
theme.blue = "#8AADF4"
theme.lavender = "#B7BDF8"
theme.base = "#24273A"
theme.mantle = "#1E2030"
theme.crust = "#181926"
theme.grey = "#6E6C7E"


theme.xbackground = theme.crust
theme.xforeground = theme.lavender

theme.bg_normal = theme.xbackground
theme.bg_focus = theme.xbackground
theme.bg_urgent = theme.xforeground
theme.bg_minimize = theme.xbackground
theme.bg_systray = theme.xbackground

theme.fg_normal = theme.xforeground
theme.fg_focus = theme.yellow
theme.fg_urgent = theme.xbackground
theme.fg_minimize = theme.xbackground

--- Wallpapers
theme.wallpaper = gears.surface.load_uncached("/home/aszegedi/Pictures/wallpaper/waves-dark.jpg")

--- Layout
--- You can use your own layout icons like this:
theme.layout_floating = icons.floating
theme.layout_max = icons.max
theme.layout_tile = icons.tile
theme.layout_dwindle = icons.dwindle
theme.layout_centered = icons.centered
theme.layout_mstab = icons.mstab
theme.layout_equalarea = icons.equalarea
theme.layout_machi = icons.machi

--- Icon Theme
--- Define the icon theme for application icons. If not set then the icons
--- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "candy-icons"

theme.tasklist_plain_task_name = true
-- theme.tasklist_shape_border_width = theme.border_width
-- theme.tasklist_shape_border_color = theme.blue
-- theme.tasklist_shape_border_color_focus = theme.yellow
theme.tasklist_shape_border_color_minimized = theme.maroon
theme.separator_color = theme.yellow


--- Corner Radius and Border
-- theme.border_normal = theme.mauve
-- theme.border_focus = theme.yellow
-- theme.border_marked = theme.mauve
-- theme.border_radius = dpi(12)
-- theme.border_width = theme.border_width

--- Edge snap
-- theme.snap_bg = theme.xcolor8
-- theme.snap_shape = helpers.ui.rrect(0)

--- Tooltip
-- theme.tooltip_bg = theme.lighter_xbackground
-- theme.tooltip_fg = theme.xforeground
-- theme.tooltip_font = theme.font_name .. "Regular 10"

--- Hotkeys Pop Up
theme.hotkeys_bg = theme.xbackground
theme.hotkeys_fg = theme.xforeground
theme.hotkeys_modifiers_fg = theme.xforeground
theme.hotkeys_font = theme.font_name .. "MonoLisa"
theme.hotkeys_description_font = theme.font_name .. "Regular 10"
theme.hotkeys_shape = helpers.ui.rrect(theme.border_radius)
theme.hotkeys_group_margin = dpi(50)

--- Tag list
local taglist_square_size = dpi(0)
theme.taglist_fg_empty = theme.grey
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.yellow)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

--- Swallowing
theme.dont_swallow_classname_list = {
	"firefox",
	"gimp",
	"Google-chrome",
	"Thunar",
}

return theme
