local awful = require("awful")
local gears = require("gears")

local folderOfThisFile = (...):match("(.-)[^%.]+$")
local modkey = require(folderOfThisFile .. "modkey").key

local _screen = {}

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  _screen.bindings = gears.table.join(_screen.bindings,
      -- View tag only.
      awful.key({ modkey }, "#" .. i + 9,
                function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         tag:view_only()
                      end
                end
                -- {description = "view tag #"..i, group = "tag"}
            ),
      -- Toggle tag display.
      awful.key({ modkey, "Control" }, "#" .. i + 9,
                function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                       awful.tag.viewtoggle(tag)
                    end
                end
                -- {description = "toggle tag #" .. i, group = "tag"}
            ),
      -- Move client to tag.
      awful.key({ modkey, "Shift" }, "#" .. i + 9,
                function ()
                    if client.focus then
                        local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:move_to_tag(tag)
                        end
                   end
                end
                -- {description = "move focused client to tag #"..i, group = "tag"}
            )
  )
end


return _screen