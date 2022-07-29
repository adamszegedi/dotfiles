local beautiful = require("beautiful")
local gears = require("gears")

local _wallpaper = {}

function _wallpaper.set(s)
  -- Wallpaper
  if beautiful.wallpaper then
      local wallpaper = beautiful.wallpaper
      -- If wallpaper is a function, call it with the screen
      if type(wallpaper) == "function" then
          wallpaper = wallpaper(s)
      end
      gears.wallpaper.maximized(wallpaper, s, true)
  end
end

return _wallpaper