--+++++++++++++++++++++++Code executed by the engine++++++++++++++++++++++++
--[[
AP CSP 2018
]]--

instahouse = {} 
instahouse.path = minetest.get_modpath("instahouse") --grabs the path to the mod folder on your computer

dofile(instahouse.path .. "/functions.lua") --creates functions
dofile(instahouse.path .. "/nodedef.lua")   --defines nodes with function calls
dofile(instahouse.path .. "/crafting.lua")  --facilitates ingame crafting

--++++++++++++++++++++functions.lua (executed by init.lua)+++++++++++++++++++++++
--basic pillar
function pillar(height, xoffset, yoffset, zoffset, nodeName) --node is the full itemname as a string
  local tall = 0
  while tall < height do
    minetest.set_node({x = posx + xoffset, y = posy + yoffset + tall, z = posz + zoffset}, {name = nodeName})
    tall =  tall + 1
  end
end

--5x4 wall
function wall(xoffset, yoffset, zoffset, node, facing)
  local length = -2
  while length < 3 do
    if facing == "x" then
      pillar(4, xoffset, yoffset, zoffset + length, node)
    elseif facing == "z" then
      pillar(4, xoffset+length, yoffset, zoffset, node)
    else
      minetest.log('Error running function "wall", inproper "facing" variable entry (not "x" or "z")')
    end
  length =  length + 1
  end
end

--Ceiling function
function flat(xoffset, yoffset, zoffset, nodeName, length, width)
	if length % 2 == 1 then
		length = length - 1
	end
	if width % 2 == 1 then
		width = width - 1
	end
	local long = (length / 2) * -1
	local wide = (width / 2) * -1
	while long < (length / 2 +1) do
		while wide < (width / 2 +1) do
			minetest.set_node({x = posx + xoffset + long, y = posy + yoffset, z = posz + zoffset + wide}, {name = nodeName})
			wide = wide + 1
		end
		long = long + 1
		wide = (width / 2) * -1
	end
end

--Small house function (7x7x5)
function small_house(xoffset, yoffset, zoffset, walls, pillars, roof, ground, door) --door 0-2
  wall(-3+xoffset,yoffset,zoffset, walls,"x")
  wall(3+xoffset,yoffset,zoffset, walls,"x")
  wall(xoffset,yoffset,3+zoffset, walls,"z")
  wall(xoffset, yoffset,-3+zoffset, walls,"z")
  pillar(4, -3+xoffset, yoffset, -3+zoffset, pillars)
  pillar(4, -3+xoffset, yoffset, 3+zoffset, pillars)
  pillar(4, 3+xoffset, yoffset, -3+zoffset, pillars)
  pillar(4, 3+xoffset, yoffset, 3+zoffset, pillars)
  flat(xoffset, yoffset+4, zoffset, roof, 7, 7)
  flat(xoffset, yoffset-1, zoffset, ground, 7, 7)
  minetest.set_node({x = posx, y = posy, z = posz}, {name = "air"})
  if door == 1 then
  	minetest.set_node({x = posx-3+xoffset, y = posy+1+yoffset, z = posz+zoffset}, {name = "air"})
  	minetest.set_node({x = posx-3+xoffset, y = posy+yoffset, z = posz+zoffset}, {name = "air"})
  elseif door == 2 then
	minetest.set_node({x = posx-3+xoffset, y = posy+1+yoffset, z = posz+zoffset}, {name = "air"})
  	minetest.set_node({x = posx-3+xoffset, y = posy+yoffset, z = posz+zoffset}, {name = "air"})
	minetest.set_node({x = posx+3+xoffset, y = posy+1+yoffset, z = posz+zoffset}, {name = "air"})
  	minetest.set_node({x = posx+3+xoffset, y = posy+yoffset, z = posz+zoffset}, {name = "air"})
	minetest.set_node({x = posx+xoffset, y = posy+1+yoffset, z = posz-3+zoffset}, {name = "air"})
  	minetest.set_node({x = posx+xoffset, y = posy+yoffset, z = posz-3+zoffset}, {name = "air"})
	minetest.set_node({x = posx+xoffset, y = posy+1+yoffset, z = posz+3+zoffset}, {name = "air"})
  	minetest.set_node({x = posx+xoffset, y = posy+yoffset, z = posz+3+zoffset}, {name = "air"})
   end
end

function nilAll()--function to set all globals to nil to save memory
	posx = nil
	posy = nil
	posz = nil
end

--+++++++++++++++++++++nodedef.lua (executed by init.lua)+++++++++++++++++++++++
--small house block
minetest.register_node("instahouse:house_small", {
	tiles = {
		"instahouse_small_house_top.png",	
		"instahouse_small_house.png",
		"instahouse_small_house.png",
		"instahouse_small_house.png",
		"instahouse_small_house.png",
		"instahouse_small_house_bottom.png"
		},
	groups = {oddly_breakable_by_hand=2},
	description = "Small House",
	after_place_node = function(pos)
		posx = pos.x
		posy = pos.y
		posz = pos.z
		small_house(0, 0, 0, "default:stonebrick", "default:tree", "default:wood", "default:wood", 1)--Standard application of the funciton
		nilAll()--Sets all three globals to nil to save memory
	end,
})

minetest.register_node("instahouse:skyscraper", {
	tiles = {
		"instahouse_skyscraper_top.png",
		"instahouse_skyscraper.png",
		"instahouse_skyscraper.png",
		"instahouse_skyscraper.png",
		"instahouse_skyscraper.png",
		"instahouse_skyscraper_top.png"
		},
	groups = {oddly_breakable_by_hand=2},
	description = "Skyscraper [1x1x20 floors]",
	after_place_node = function(pos)
		posx = pos.x
		posy = pos.y
		posz = pos.z
		small_house(0, 0, 0, "default:glass", "default:steelblock", "default:steelblock", "default:steelblock", 1)
		for i=1,19,1 do --iterates 19 additional times for a stack of modified small houses
			small_house(0, 0+i*5, 0, "default:glass", "default:steelblock", "default:steelblock", "default:steelblock", 0)
		end
		nilAll()
	end,
})

--mansion 5 x 5 x 3 floors high
minetest.register_node("instahouse:mansion", {
	tiles = {"instahouse_mansion.png"},
	groups = {oddly_breakable_by_hand=2},
	description = "Mansion [5x5x3 Floors]",
	after_place_node = function(pos)
		posx = pos.x
		posy = pos.y
		posz = pos.z
		local addfloor = 0
		local long = 0
		local wide = 0
		while addfloor < 3 do
			while long < 5 do
				while wide < 5 do
					small_house(0+(long*6), 0+(addfloor*5), 0+(wide*6), "default:stonebrick", "default:tree", "default:wood", "default:wood", 2)
					wide = wide + 1
				end
				long = long + 1
				wide = 0
			end
		long = 0
		addfloor = addfloor + 1
		end
		nilAll()
	end,
})
-- 15 x 15 x 15 floors high
-- strong computer fryability beward
minetest.register_node("instahouse:super_mansion", {
	tiles = {"instahouse_mansion.png"},
	groups = {oddly_breakable_by_hand=2}, --add roof tile
	description = "Super Mansion [15^3, Beware]",
	after_place_node = function(pos)
		posx = pos.x
		posy = pos.y
		posz = pos.z
		minetest.log('Running "Super Mansion"')--useful for checking in the case of crashes
		local addfloor = 0
		local long = 0
		local wide = 0
		while addfloor < 15 do
			while long < 15 do
				while wide < 15 do
					small_house(0+(long*6), 0+(addfloor*5), 0+(wide*6), "default:stonebrick", "default:tree", "default:wood", "default:wood", 2)
					wide = wide + 1
				end
				long = long + 1
				wide = 0
			end
		long = 0
		addfloor = addfloor + 1
		end
		nilAll()
	minetest.log("Mansion sucessfully built")
	end,
})

--Gigantomite (ore, item, ore spawn info)
minetest.register_node("instahouse:gigantomite_ore", {
		tiles = {"default_stone.png^instahouse_gigantomite_ore.png"},
		description = "Gigantomite Ore",
		groups = {cracky=3},
		drop = "instahouse:gigantomite"
})

minetest.register_ore({
		ore_type = "scatter",
		ore = "instahouse:gigantomite_ore",
		wherein = "default:stone",
		clust_scarcity = 20 * 20 * 20,
		clust_num_ores = 10,
		clust_size = 13,
		y_min = -31000,
		y_max = -100,
})

minetest.register_craftitem("instahouse:gigantomite", {
		description = "Gigantomite",
		inventory_image = "instahouse_gigantomite.png"
})
--+++++++++++++++++++++++crafting.lua (executed by init.lua)++++++++++++++++++

--Small house crafting
minetest.register_craft({
		output = 'instahouse:house_small',
		recipe = {
				{'default:wood', 'default:wood', 'default:wood'},
				{'default:cobble', 'instahouse:gigantomite', 'default:cobble'},
				{'default:cobble', 'default:cobble', 'default:cobble'},
		}
})

--Mansion crafting
minetest.register_craft({
		output = 'instahouse:mansion',
		recipe = {
				{'instahouse:small_house', 'instahouse:small_house', 'instahouse:small_house'},
				{'instahouse:small_house', 'instahouse:gigantomite', 'instahouse:small_house'},
				{'instahouse:small_house', 'instahouse:small_house', 'instahouse:small_house'},
		}
})

--Super mansion crafting
minetest.register_craft({
		output = 'instahouse:super_mansion',
		recipe = {
				{'instahouse:mansion', 'instahouse:mansion', 'instahouse:mansion'},
				{'instahouse:mansion', 'instahouse:gigantomite', 'instahouse:mansion'},
				{'instahouse:mansion', 'instahouse:mansion', 'instahouse:mansion'},
		}
})

--Skyscraper Crafting
minetest.register_craft({
		output = 'instahouse:skyscraper',
		recipe = {
				{'default:steelblock', 'instahouse:gigantomite', 'default:steelblock'},
				{'default:glass', 'instahouse:gigantomite', 'default:glass'},
				{'default:steelblock', 'instahouse:gigantomite', 'default:steelblock'},
		}
})

