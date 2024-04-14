local s = {}


local function isVisible(street)
	return street.upgrade==false
end

local function hasNumLanes(street,numlanes)
	return #street.laneConfigs==numlanes
end

local function isOneWayStreet(street)
	for i,lane in pairs(street.laneConfigs) do
		if lane.forward==false then
			return false
		end
	end
	return true
end


s.getStreetTypes = function(visibleOnly,excludeOneWay,onlyNumLanes,sortcountry)
	local streetRep = api.res.streetTypeRep.getAll()
	local stypes = {}
	local snames = {}
	local countrycounter = 0
	for sid,stype in pairs(streetRep) do
		--print(stype)
		local street = api.res.streetTypeRep.get(sid)
		--debugPrint(street)
		--print(#street.laneConfigs)
		if (visibleOnly and isVisible(street)) or (not visibleOnly and true) then
			if (excludeOneWay and not isOneWayStreet(street)) or (not excludeOneWay and true) then
				if (onlyNumLanes and hasNumLanes(street,onlyNumLanes)) or (not onlyNumLanes and true) then
					local pos = #stypes + 1 - countrycounter
					if sortcountry and street.country then  -- sort country after town
						countrycounter = countrycounter + 1
						pos = #stypes + 1
					end
					table.insert(stypes, pos, stype)
					table.insert(snames, pos, street.name)--string.format("%s (%s)", street.name, street.desc)) --string.format("%s (%s)", street.name, stype)
				end
			end
		end
	end
	return stypes, snames
end

return s