--where the building functions will be stored

--basic pillar | F
function pillar(height, xoffset, yoffset, zoffset, nodeName) --node is the full itemname as a string
  local tall = 0
  while tall < height do
    minetest.set_node({x = posx + xoffset, y = posy + yoffset + tall, z = posz + zoffset}, {name = nodeName})
    tall =  tall + 1
  end
end
--5x4 wall | F
function wall(xoffset, yoffset, zoffset, node, facing)
  local length = -2
  while length < 3 do
    if facing == "x" then
      pillar(4, xoffset, yoffset, zoffset + length, node)
    elseif facing == "z" then
      pillar(4, xoffset+length, yoffset, zoffset, node)
    else
      minetest.log('Error running function "wall", inproper "facing" variable entry (not "x" or "z")')
    end
  length =  length + 1
  end
end

--Ceiling function | F
function flat(xoffset, yoffset, zoffset, nodeName, length, width)
	if length % 2 == 1 then
		length = length - 1	
	end
	if width % 2 == 1 then
		width = width - 1	
	end
	local long = (length / 2) * -1
	local wide = (width / 2) * -1
	while long < (length / 2 + 1) do
		while wide < (width / 2 + 1) do
			minetest.set_node({x = posx + xoffset + long, y = posy + yoffset, z = posz + zoffset + wide}, {name = nodeName})
			wide = wide + 1
		end
		long = long + 1
		wide = (width / 2) * -1
	end
end

--Small house function | F
function small_house(xoffset, yoffset, zoffset, walls, pillars, roof, ground)
  wall(-3+xoffset,yoffset,zoffset, walls,"x")
  wall(3+xoffset,yoffset,zoffset, walls,"x")
  wall(xoffset,yoffset,3+zoffset, walls,"z")
  wall(xoffset, yoffset,-3+zoffset, walls,"z")
  pillar(4, -3+xoffset, yoffset, -3+zoffset, pillars)
  pillar(4, -3+xoffset, yoffset, 3+zoffset, pillars)
  pillar(4, 3+xoffset, yoffset, -3+zoffset, pillars)
  pillar(4, 3+xoffset, yoffset, 3+zoffset, pillars)
  flat(xoffset, yoffset+4, zoffset, roof, 7, 7)
  flat(xoffset, yoffset-1, zoffset, ground, 7, 7)
  minetest.set_node({x = posx, y = posy, z = posz}, {name = "air"})
  minetest.set_node({x = posx-3, y = posy+1, z = posz}, {name = "air"})
  minetest.set_node({x = posx-3, y = posy, z = posz}, {name = "air"})
end
--[[
--builds a wall | A
function wall (loc, height, xoffset, yoffset, zoffset, node)
  minetest.set_node(
]]--
