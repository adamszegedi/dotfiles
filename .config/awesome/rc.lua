-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- ###########################################
-- Local Dependencies
-- ###########################################
local helpers = require("helpers")
local keybindings = require("config").keybindings
local layout = require("layout")


-- ###########################################
-- Handle startup and runtime error
-- ###########################################
helpers.errorHandler.run()


-- ###########################################
-- Init Themes
-- ###########################################
local theme_dir = gears.filesystem.get_configuration_dir() .. "theme/"
beautiful.init(theme_dir .. "theme.lua")


-- ###########################################
-- Defaults
-- ###########################################
-- GLOBAL
TERMINAL = "kitty"
EDITOR = "vscodium"
BROWSER = "firefox"
-- ###########################################
-- Initialize layout
-- ###########################################
layout.setup()


-- ###########################################
-- KEYBINDING
-- ###########################################
root.keys(keybindings.bindings)


-- ###########################################
-- RULES
-- Rules to apply to new clients (through the "manage" signal).
-- ###########################################
awful.rules.rules = layout.rules.get(beautiful.border_width, beautiful.border_normal)

-- ###########################################
-- Signals
-- Signal function to execute when a new client appears.
-- ###########################################
layout.signals.setup(beautiful.border_focus, beautiful.border_normal)

awful.util.spawn("nm-applet")
naughty.notify({text = "config loaded for awesome"})
