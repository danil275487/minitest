if minetest.get_mapgen_setting('mg_name') == "singlenode" then
	local data = {}
	minetest.register_on_generated(function(minp, maxp, blockseed)
		local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
		local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
		vm:get_data(data)

		for z = 0, 79 do
			for y = 0, 79 do
				for x = 0, 79 do
					local pos = {
						x = minp.x + x,
						y = minp.y + y,
						z = minp.z + z
					}
					local posi = area:index(pos.x, pos.y, pos.z)
					if (pos.x >= -31000 and pos.x <= 31000) and (pos.z >= -31000 and pos.z <= 31000) and (pos.y >= -31000 and pos.y <= -1) then
						data[posi] = minetest.get_content_id("mt_nodes:stone")
					end
				end
			end
		end
		vm:set_data(data)
		vm:write_to_map()
	end)
end