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
theme.border_width = dpi(3)
awesome.set_preferred_icon_size(64)

--- Ui Fonts
theme.font_name = "JetBrainsMono Nerd Font"
theme.font = theme.font_name .. " 14"

--- Icon Fonts
theme.icon_font = "Material Icons "

--- ░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀
--- ░█░░░█░█░█░░░█░█░█▀▄░▀▀█
--- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

theme.fg_normal  = "#d79921"
theme.fg_focus   = "#b8bb26"
theme.fg_urgent  = "#cc241d"
theme.fg_minimize = "#928374"

theme.bg_normal  = "#1d2021"
theme.bg_focus   = "#1d2021"
theme.bg_urgent  = "#1d2021"
theme.bg_systray = "#1d2021"
theme.bg_minimize = "#1d2021"
theme.bg_underline = "#1d2021"


--- Wallpapers
theme.wallpaper = gears.surface.load_uncached("/home/aszegedi/Pictures/wallpaper/traffic-light-fog.jpg")

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
theme.hotkeys_bg = "#1d2021"
theme.hotkeys_fg = "#d79921"
theme.hotkeys_modifiers_fg = "#d79921"
theme.hotkeys_font = theme.font_name .. "MonoLisa"
theme.hotkeys_description_font = theme.font_name .. "Regular 10"
theme.hotkeys_shape = helpers.ui.rrect(theme.border_radius)
theme.hotkeys_group_margin = dpi(50)

--- Tag list
local taglist_square_size = dpi(0)
theme.taglist_fg_empty = "#504945"
theme.taglist_fg_occupied = "#468588"
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, "#a89984")
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, "#a89984")

return theme
