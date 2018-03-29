--where the building functions will be stored

--basic pillar | F
function pillar (height, xoffset, yoffset, zoffset, node) --node is the full itemname as a string
  local tall = 0;
  for tall < height do
    minetest.set_node({x = pos.x + xoffset, y = pos.y + yoffset + tall, z = pos.z + zoffset}, {name = node}),
    height =  height + 1,
  end,
end,
--5x4 wall
function wall(xoffset, yoffset, zoffset, node, facing)
  local length = -2,
  for length < 2 do
    if facing == "x" then
      function pillar (4, xoffset, yoffset, zoffset+length, node),
    elseif facing == "z" then
      function pillar (4, xoffset+length, yoffset, zoffset, node),
    else
      minetest.log('Error running function "wall", inproper "facing" variable entry (not "x" or "z")'),
    end,
  length =  length + 1,
  end,
end,



function small_house()
  
  
end,

--example call | pillar(4, 0, 0, 0, "default:dirt")
--builds a wall | A
function wall (loc, height, xoffset, yoffset, zoffset, node)
  minetest.set_node(
