--where the building functions will be stored

--basic pillar | F
function pillar (height, xoffset, yoffset, zoffset, node) --node is the full itemname as a string
  local tall = 0;
  for tall < height do
    minetest.set_node({x = pos.x + xoffset, y = pos.y + yoffset + tall, z = pos.z + zoffset}, {name = node}),
    height =  height + 1,
  end,
end,
--5x4 wall | F
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

--Ceiling function | F
function flat(xoffset, yoffset, zoffset, node, length, width)
	if length % 2 == 1 do
		length =  length - 1,	
	end,
	if width % 2 == 1 do
		width = width - 1,	
	end,
	local long = (length / 2) * -1,
	local wide = (width / 2) * -1,
	for long < (length / 2) do
		for wide < (width / 2) do
			minetest.set_node({x = pos.x + xoffset, y = pos.y + yoffset, z = pos.z + zoffset + wide}, {name = node}),
			wide = wide + 1,
		end,
		long = long + 1,
	end,
end,

--Small house function | F
function small_house(xoffset, yoffset, zoffset, walls, pillars, roof, floor)
  wall(-3+xoffset,yoffset,zoffset, walls,"x"),
  wall(3+xoffset,yoffset,zoffset, walls,"x"),
  wall(xoffset,yoffset,3+zoffset, walls,"z"),
  wall(xoffset, yoffset,-3+zoffset, walls,"z"),
	pillar(4, -3+xoffset, yoffset, -3+zoffset, pillars),
  pillar(4, -3+xoffset, yoffset, 3+zoffset, pillars),
  pillar(4, 3+xoffset, yoffset, -3+zoffset, pillars),
  pillar(4, 3+xoffset, yoffset, 3+zoffset, pillars),
end,

--builds a wall | A
function wall (loc, height, xoffset, yoffset, zoffset, node)
  minetest.set_node(
