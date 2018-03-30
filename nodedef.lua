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
			small_house(0, 0+i*5, 0, "default:glass", "default:steelblock", "default:steelblock", "default:steelblock", true)
		end
	end,
})
