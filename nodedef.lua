--new nodes go in here

minetest.register_node("instahouse:house_small", {
	tiles = {
		"instahouse_house_small_top.png",	
		"instahouse_house_small.png",
		"instahouse_house_small.png",
		"instahouse_house_small.png",
		"instahouse_house_small.png",
		"instahouse_house_small_bottom.png"
		},
	groups = {oddly_breakable_by_hand=2}, --add roof tile
	description = "Small House",
	after_place_node = function(pos)
		posx = pos.x --I should be crucified for my use of globals here
		posy = pos.y
		posz = pos.z
		minetest.log(posx)
		small_house(0, 0, 0, "default:stonebrick", "default:tree", "default:wood", "default:wood", 1)
	end,
})

minetest.register_node("instahouse:skyscraper", {
	tiles = {"instahouse_skyscraper.png"},
	groups = {oddly_breakable_by_hand=2}, --add roof tile
	description = "Skyscraper",
	after_place_node = function(pos)
		posx = pos.x
		posy = pos.y
		posz = pos.z
		minetest.log(posx)
		small_house(0, 0, 0, "default:glass", "default:steelblock", "default:steelblock", "default:steelblock", 1)
		for i=1,i<6,1 do
			small_house(0, 0+i*5, 0, "default:glass", "default:steelblock", "default:steelblock", "default:steelblock", 0)
		end
	end,
})

minetest.register_node("instahouse:mansion", {
	tiles = {"instahouse_mansion.png"},
	groups = {oddly_breakable_by_hand=2}, --add roof tile
	description = "Mansion",
	after_place_node = function(pos)
		posx = pos.x
		posy = pos.y
		posz = pos.z
		minetest.log(posx)
		for i=1,i<4,1 do
			local addfloor = 0
			local long = 0
			local wide = 0
			while long < 5 do
				while wide < 5 do
					small_house(0, 0+addfloor, 0+wide, "default:stonebrick", "default:tree", "default:wood", "default:wood", 2)
					wide = wide + 1
				end
				long = long + 1
				wide = 0
			end
		end
	end,
})

