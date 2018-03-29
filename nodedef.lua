--new nodes go in here
minetest.register_node("instahouse:house_small", {
	tiles = {"instahouse_house_small.png"},
	groups = {oddly_breakable_by_hand=2},
	description = "Small House",
	after_place_node = func(pos)
		wall(-3,0,0,"default:stonebrick","x"),
		wall(3,0,0,"default:stonebrick","x"),
		wall(0,0,-3,"default:stonebrick","z"),
		wall(0,0,3,"default:stonebrick","z"),
		pillar(4, -3, yoffset, 3, "default:tree"),
		pillar(4, 3, yoffset, 3, "default:tree"),
		pillar(4, -3, yoffset, -3, "default:tree"),
		pillar(4, 3, yoffset, -3, "default:tree")
	end,
})
