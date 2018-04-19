--[[
    _/_/_/_/                 _/_/_/        _/        _/_/_/
   _/     _/                _/  _/        _/ _/_/_/ _/
  _/_/      _/_/_/ _/_/_/  _/_/_/ _/  _/ _/ _/  _/ _/_/_/
 _/     _/ _/  _/ _/  _/  _/_/   _/  _/ _/ _/         _/
_/     _/ _/  _/ _/  _/  _/  _/ _/_/_/ _/ _/_/_/ _/_/_/
]]--

instahouse = {}
instahouse.path = minetest.get_modpath("instahouse")

dofile(instahouse.path .. "/functions.lua") --creates functions
dofile(instahouse.path .. "/nodedef.lua")   --defines nodes with function calls
dofile(instahouse.path .. "/crafting.lua")  --facilitates ingame crafting
