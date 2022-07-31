local gears = require("gears")
local _global = require(... .. ".global").bindings
local _client = require(... .. ".client")
local _screen = require(... .. ".screen").bindings
local _modkey = require(... .. ".modkey").key

local _bindings = gears.table.join(_global, _screen)

return {
  bindings = _bindings,
  client = _client,
  modkey = _modkey
}