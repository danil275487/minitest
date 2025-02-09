local node = core.settings:get("mini_flat_node") or "mini_nodes:stone"

if core.get_mapgen_setting('mg_name') == "singlenode" then
	local data = {}
	core.register_on_generated(function(minp, maxp, blockseed)
		local vm, emin, emax = core.get_mapgen_object("voxelmanip")
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
					if (pos.x >= -31000 and pos.x <= 31000)
						and (pos.z >= -31000 and pos.z <= 31000)
						and (pos.y >= -31000 and pos.y <= -1) then
						data[posi] = core.get_content_id(node)
					end
				end
			end
		end
		vm:set_data(data)
		vm:write_to_map()
	end)
end
