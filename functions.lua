--where the building functions will be stored

--basic pillar | F
function pillar (loc, height, xoffset, yoffset, zoffset, node) --node is the full itemname as a string
  local tall = 0;
  for tall < height do
    minetest.set_node({x = pos.x + xoffset, y = pos.y + yoffset + tall, z = pos.z + zoffset}, {name = node}),
    height =  height + 1,
  end,
end,

--example call | pillar(pos, 4, 0, 0, 0, "default:dirt")
--builds a wall | A
function wall (loc, height, xoffset, yoffset, zoffset, node)
  minetest.set_node(
