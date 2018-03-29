--where the building functions will be stored

--basic pillar | F
function pillar (loc, height, xoffset, yoffset, zoffset, node) --node is the full itemname as a string
  minetest.set_node({x = pos.x + xoffset, y = pos.y + yoffset, z = pos.z + zoffset}, {name = node})
  
end,
--builds a wall | A
function wall (loc, height, xoffset, yoffset, zoffset, node)
  minetest.set_node(
