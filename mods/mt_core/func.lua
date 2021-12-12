--Easier schematic loading
function mts(name)
	return minetest.get_modpath("mt_mapgen").."/schems/"..name..".mts"
end

-- Simple formspec wrapper that does variable substitution
function formspec_wrapper(formspec, variables)
	local retval = formspec
	for k,v in pairs(variables) do
		retval = retval:gsub("${"..k.."}", v)
	end
	return retval
end