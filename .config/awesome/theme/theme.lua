
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
local border_width = dpi(2)

--- Ui Fonts
theme.font_name = "JetBrainsMono Nerd Font"
theme.font = theme.font_name .. " 12"

--- Icon Fonts
theme.icon_font = "Material Icons "

--- ░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀
--- ░█░░░█░█░█░░░█░█░█▀▄░▀▀█
--- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

theme.black = "#161320"
theme.deep_black = "#575268"
theme.white = "#575268"
theme.light_white = "#C3BAC6"
theme.pink = "#F5E0DC"
theme.red = "#F28FAD"
theme.orange = "#F8BD96"
theme.yellow = "#FAE3B0"
theme.green = "#ABE9B3w"
theme.blue = "#96CDFB"
theme.purple = "#F2CDCD"
theme.grey = "#6E6C7E"

theme.bg_normal = theme.black
theme.bg_focus = theme.black
theme.bg_urgent = theme.white
theme.bg_minimize = theme.grey
theme.bg_systray = theme.black

theme.fg_normal = theme.white
theme.fg_focus = theme.orange
theme.fg_urgent = theme.red
theme.fg_minimize = theme.light_white

--- Wallpapers
theme.wallpaper = gears.surface.load_uncached("/home/aszegedi/Pictures/wallpaper/black5_unicat.png")

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
theme.icon_theme = "WhiteSur-dark"

theme.tasklist_plain_task_name = true
theme.tasklist_shape_border_width = 0
theme.tasklist_shape_border_color = theme.blue
theme.tasklist_shape_border_color_focus = theme.yellow

--- Corner Radius and Border

theme.border_normal = theme.blue
theme.border_focus = theme.yellow
theme.border_marked = theme.purple
theme.border_radius = dpi(12)
theme.border_width = border_width

--- Edge snap
theme.snap_bg = theme.xcolor8
theme.snap_shape = helpers.ui.rrect(0)

--- Tooltip
theme.tooltip_bg = theme.lighter_xbackground
theme.tooltip_fg = theme.xforeground
theme.tooltip_font = theme.font_name .. "Regular 10"

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
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.yellow)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

--- Gaps
theme.useless_gap = dpi(2)


--- Swallowing
theme.dont_swallow_classname_list = {
	"firefox",
	"gimp",
	"Google-chrome",
	"Thunar",
}

return theme
