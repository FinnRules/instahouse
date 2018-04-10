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
		posx = pos.x --I should be crucified for my use of globals here
		posy = pos.y
		posz = pos.z
		small_house(0, 0, 0, "default:stonebrick", "default:tree", "default:wood", "default:wood", 1)
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
	description = "Skyscraper",
	after_place_node = function(pos)
		posx = pos.x
		posy = pos.y
		posz = pos.z
		small_house(0, 0, 0, "default:glass", "default:steelblock", "default:steelblock", "default:steelblock", 1)
		for i=1,20,1 do
			small_house(0, 0+i*5, 0, "default:glass", "default:steelblock", "default:steelblock", "default:steelblock", 0)
		end
	end,
})

minetest.register_node("instahouse:mansion", {
	tiles = {"instahouse_mansion.png"},
	groups = {oddly_breakable_by_hand=2},
	description = "Mansion",
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

	end,
})

minetest.register_node("instahouse:super_mansion", {
	tiles = {"instahouse_mansion.png"},
	groups = {oddly_breakable_by_hand=2}, --add roof tile
	description = "Super Mansion",
	after_place_node = function(pos)
		posx = pos.x
		posy = pos.y
		posz = pos.z
		minetest.log("running super mansion")
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
	end,
})

