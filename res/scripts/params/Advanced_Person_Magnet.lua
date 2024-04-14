local ParamBuilder = require "parambuilder_v1_1"

local landuseTypes = {"RESIDENTIAL","COMMERCIAL","INDUSTRIAL"}
--[[local model_icons = {
	"ui/construction/asset/temperate/azalea.tga",
	"ui/construction/asset/temperate/shingle_oak.tga",
	"ui/construction/asset/tropical/date_palm.tga",
	"ui/construction/asset/desert/saguaro_cactus.tga",
	"ui/construction/asset/default_multi_bench_new.tga",
	"ui/construction/asset/default_multi_bench_old.tga",
	"ui/construction/asset/default_multi_lamp.tga",
	"ui/construction/asset/rock_cracked_02.tga",
	"ui/construction/asset/rock_granite_02.tga",
	"ui/construction/asset/rock_sandstone_03.tga",
	"ui/construction/asset/headquarter.tga",
}]]
local model_values = {
	"asset/lamp_old.mdl",
	"asset/lamp_new.mdl",
	"asset/hydrant_new.mdl",
	"asset/hydrant_old.mdl",
	"asset/ground/fountain_1.mdl",
	"asset/park_fountain_1.mdl",
	"asset/park_kiosk_1.mdl",
	"asset/bench_new.mdl",
	"asset/bench_old.mdl",
	"asset/ground/garden_bench_stone_01.mdl",
	"asset/ground/garden_bench_wood_01.mdl",
	"APM/invisible.mdl",
	--"unit_cube.mdl",
	"tree/azalea.mdl",
	"tree/shingle_oak.mdl",
	"tree/tropical/date_palm.mdl",
	"tree/usa/saguaro_cactus.mdl",
	"asset/rocks/rock_granite_02.mdl",
	"asset/rocks/rock_cracked_02.mdl",
	"asset/rocks/rock_sandstone_03.mdl",
	"headquarter/headquarter_era_a_01.mdl",
	"headquarter/headquarter_era_a_02.mdl",
	"headquarter/headquarter_era_b_03.mdl",
	"headquarter/headquarter_era_b_04.mdl",
	"headquarter/headquarter_era_c_05.mdl",
	"asset/ground/barrel_steel.mdl",
	"asset/ground/container_waste2.mdl",
	"asset/ground/era_a/garden_sunshade_01_a.mdl",
	"asset/ground/garden_sun_pavillion_01.mdl",
	"asset/ground/tipi_medium.mdl",
	"asset/commercial/era_a/waggon_01.mdl",
	"asset/commercial/era_a/market_04.mdl",
	"asset/commercial/era_b/market_stall_02_a.mdl",
	"asset/ground/tribune.mdl",
	"asset/construction_1850.mdl",
	"asset/construction_1900.mdl",
	"asset/construction/crane/era_b_mast.mdl",
	"asset/ground/construction_shack.mdl",
	"asset/industry/ind_shelter_02.mdl",
	"asset/industry/ind_chimney_1_full.mdl",
	"asset/industry/ind_chimney_2_full.mdl",
	"asset/industry/ind_chimney_3_full.mdl",
	"asset/industry/silo_vertical_11m_01.mdl",
	"asset/industry/silo_vertical_14m_02.mdl",
}

local params = {
	Landuse = ParamBuilder.Button("APMlanduseType", _("Landuse"), landuseTypes ),
	PCapacity = ParamBuilder.Slider("APMpersonCapacity", _("Person Capacity"), ParamBuilder.range(0,800,10) , 5 ),
	Street = ParamBuilder.Combobox("APMstreetType", _("Street Type"), {"dummy","standard/town_medium_new.lua"} ), --, nil, _("str_tt"), {"No street","std"} ), -- will be modified in postRunFn
	StreetLen = ParamBuilder.Slider("APMstreetlength", _("Street Length").." [m]", ParamBuilder.range(1,20,0.2) , 20 ),
	StreetBoth = ParamBuilder.Checkbox("APMstreetboth", _("Street Both Sides"), false ),
	Model = ParamBuilder.Combobox("APMmodel", _("Model"), model_values ),
	Rotation = ParamBuilder.Slider("APMRotation", _("Rotation").." [°]", ParamBuilder.range(0,360,5) ),
	OffsetX = ParamBuilder.Slider("APMOffsetX", _("Offset X").." [m]", ParamBuilder.rangeSymm(20,0.2), 20/0.2 ),
	OffsetY = ParamBuilder.Slider("APMOffsetY", _("Offset Y").." [m]", ParamBuilder.rangeSymm(20,0.2), 20/0.2 ),
	TerrainAlign = ParamBuilder.Checkbox("APMterrain", _("Terrain Align Automatic"), false),
}

-- local getParamsDef = function(params)
	-- local retPrm = {}
	-- for _,p in pairs(params) do  -- unfortunately not ordered like above
		-- table.insert(retPrm, p.params)
	-- end
	-- return retPrm
-- end

params.paramsDef = { -- for definition in .con
	params.Model.params,
	params.Landuse.params,
	params.PCapacity.params,
	params.Street.params,
	params.StreetLen.params,
	params.StreetBoth.params,
	params.OffsetX.params,
	params.OffsetY.params,
	params.Rotation.params,
	params.TerrainAlign.params,
} --getParamsDef(params)

return params