local streetRep = require "APM_streetRep"

function data()
	return {
		info = {
			name = _("Advanced Person Magnet"),
			description = _("mod_desc"),
			minorVersion = 1,
			severityAdd = "NONE",
			severityRemove = "WARNING",
			tags = {"Misc", "Person", "Magnet", "Visitor", "Person Capacity" },
			authors = {
				{
					name = "VacuumTube",
					role = "CREATOR",
					tfnetId = 29264,
				},
			},
			params = {
				
			}
		},
		postRunFn = function (settings, modparams)
			
			local streetTypes, streetNames = streetRep.getStreetTypes(true,true,4,true)
			--debugPrint(streetTypes)
			table.insert(streetNames,1, "--- ".._("No street").." ---" )
			
			local APMcon = api.res.constructionRep.get(api.res.constructionRep.find("Advanced_Person_Magnet.con"))
			--debugPrint(APMcon)
			for _,p in pairs(APMcon.params) do 
				if p.key=="APMstreetType" then 
					p.values = streetNames
				end
			end
			
			APMcon.updateScript.fileName = "construction/Advanced_Person_Magnet.updateFn"
			APMcon.updateScript.params = {
				StreetTypes = streetTypes,
			}
		end
	}
end