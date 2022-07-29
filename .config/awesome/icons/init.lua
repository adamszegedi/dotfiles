--- Icons directory
local gfs = require("gears.filesystem")
local dir = gfs.get_configuration_dir() .. "icons/"

return {
	--- layouts
	floating = dir .. "layouts/floating.png",
	max = dir .. "layouts/max.png",
	tile = dir .. "layouts/tile.png",
	dwindle = dir .. "layouts/dwindle.png",
	centered = dir .. "layouts/centered.png",
	mstab = dir .. "layouts/mstab.png",
	equalarea = dir .. "layouts/equalarea.png",
	machi = dir .. "layouts/machi.png",
}
