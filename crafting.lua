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
