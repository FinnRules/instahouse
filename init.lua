--[[
AP CSP 2018
]]--

instahouse = {} 
instahouse.path = minetest.get_modpath("instahouse") --grabs the path to the mod folder on your computer

dofile(instahouse.path .. "/functions.lua") --creates functions
dofile(instahouse.path .. "/nodedef.lua")   --defines nodes with function calls
dofile(instahouse.path .. "/crafting.lua")  --facilitates ingame crafting
