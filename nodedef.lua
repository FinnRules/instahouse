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
