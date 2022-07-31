local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")
-- Standard awesome library
local gears = require("gears")

-- ###########################################
-- Local Dependencies
-- ###########################################
local helpers = require("helpers")
local keybindings = require("config").keybindings


-- LOCAL
local modkey = keybindings.modkey

local _layout = {}

function _layout.setup()
  -- Table of layouts to cover with awful.layout.inc, order matters.
  awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.spiral,
    awful.layout.suit.floating,
    awful.layout.suit.max,
  }

  -- Create a textclock widget
  local mytextclock = wibox.widget.textclock()

  -- Create a wibox for each screen and add it
  local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

  local tasklist_buttons = gears.table.join(
                    awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                    awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                    awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                    awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

  -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
  screen.connect_signal("property::geometry", helpers.wallpaper.set)

  awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    helpers.wallpaper.set(s)
    local tag1 = "  "
    local tag2 = "  "
    local tag3 = "  "
    local tag4 = "  "
    local tag5 = "  "
    local tag6 = "  "
    local tag7 = "  "
    local tag8 = " ﴬ "
    local tag9 = "  "


    -- Each screen has its own tag table.
    awful.tag({ tag1, tag2, tag3, tag4, tag5, tag6, tag7, tag8, tag9 }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                          awful.button({ }, 1, function () awful.layout.inc( 1) end),
                          awful.button({ }, 3, function () awful.layout.inc(-1) end),
                          awful.button({ }, 4, function () awful.layout.inc( 1) end),
                          awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        style    = {
            shape  = gears.shape.rounded_bar,
        }
        ,layout   = {
            spacing = 25,
            spacing_widget = {
                {
                    forced_width = 5,
                    shape        = gears.shape.circle,
                    widget       = wibox.widget.separator
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            layout  = wibox.layout.flex.horizontal
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
                {
                    {
                        {
                            {
                                id     = 'icon_role',
                                widget = wibox.widget.imagebox,
                            },
                            margins = 5,
                            widget  = wibox.container.margin,
                        },
                        {
                            id     = 'text_role',
                            widget = wibox.widget.textbox,
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    left  = 15,
                    right = 15,
                    widget = wibox.container.margin
                },
                id     = 'background_role',
                widget = wibox.container.background,
                margins = 5
        },
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
  end)
end

return _layout