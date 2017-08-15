
local rails_path_concrete = "__Bio_Industries__/graphics/entities/wood_products/"
local rails = data.raw["straight-rail"]["bi-straight-rail"]

local rail_sheet = {
rails.pictures.straight_rail_horizontal.ties.sheet.filename = rails_path_concrete .. "straight-rail-concrete/straight-rail-horizontal-ties.png"
rails.pictures.straight_rail_horizontal.ties.sheet.hr_version.filename = rails_path_concrete .. "straight-rail-concrete/hr-straight-rail-horizontal-ties.png"
rails.pictures.straight_rail_vertical.ties.sheet.filename = rails_path_concrete .. "straight-rail-concrete/straight-rail-vertical-ties.png"
rails.pictures.straight_rail_vertical.ties.sheet.hr_version.filename = rails_path_concrete .. "straight-rail-concrete/hr-straight-rail-vertical-ties.png"
rails.pictures.straight_rail_diagonal_left_top.ties.sheet.filename = rails_path_concrete .. "straight-rail-concrete/straight-rail-diagonal-left-top-ties.png"
rails.pictures.straight_rail_diagonal_left_top.ties.sheet.hr_version.filename = rails_path_concrete .. "straight-rail-concrete/hr-straight-rail-diagonal-left-top-ties.png"
rails.pictures.straight_rail_diagonal_right_top.ties.sheet.filename = rails_path_concrete .. "straight-rail-concrete/straight-rail-diagonal-right-top-ties.png"
rails.pictures.straight_rail_diagonal_right_top.ties.sheet.hr_version.filename = rails_path_concrete .. "straight-rail-concrete/hr-straight-rail-diagonal-right-top-ties.png"
rails.pictures.straight_rail_diagonal_right_bottom.ties.sheet.filename = rails_path_concrete .. "straight-rail-concrete/straight-rail-diagonal-right-bottom-ties.png"
rails.pictures.straight_rail_diagonal_right_bottom.ties.sheet.hr_version.filename = rails_path_concrete .. "straight-rail-concrete/hr-straight-rail-diagonal-right-bottom-ties.png"
rails.pictures.straight_rail_diagonal_left_bottom.ties.sheet.filename = rails_path_concrete .. "straight-rail-concrete/straight-rail-diagonal-left-bottom-ties.png"
rails.pictures.straight_rail_diagonal_left_bottom.ties.sheet.hr_version.filename = rails_path_concrete .. "straight-rail-concrete/hr-straight-rail-diagonal-left-bottom-ties.png"
}


function change_graphics (was_picture, sheet_element, quality)
	local picture = {}
	local k = 1
	--if not sheet_element.shift then sheet_element.shift = {x= 0, y= 0} end
	--log(serpent.block(was_picture, {comment = false}))
	if (quality == "hq") and (was_picture.hr_version) then
		log ("hq")
		picture = was_picture.hr_version
		k = 2
	else
		log ("lq")
		picture = was_picture
		k = 1
	end
	log (sheet_element.number .. " Quality = " .. quality)
	--[[
	if not (picture) then return end
	picture.filename = sheet_path .. quality .. "_" .. sheet_name
	picture.width = 8 * k * sheet_element.size.x
	picture.height = 8 * k * sheet_element.size.y
	picture.scale = 1/k
	picture.x = 8 * k * sheet_element.position.x
	picture.y = 8 * k * sheet_element.position.y
	picture.shift = {}
	--picture.shift.x = -8/32 * k * sheet_element.shift.x
	--picture.shift.y = -8/32 * k * sheet_element.shift.y	
	picture.shift.x = -8/32  * sheet_element.shift.x
	picture.shift.y = -8/32  * sheet_element.shift.y
	log (sheet_element.number .. " Quality = " .. quality .. " - Success")
]]
end


local rails_picture = data.raw["straight-rail"]["bi-straight-rail-wood"].pictures

for i, was_picture in pairs (rails_picture) do
	for j, sheet_element in pairs (rail_sheet) do
		if i == j then
			log (i)
			change_graphics (was_picture, sheet_element, "hq")
			change_graphics (was_picture, sheet_element, "lq")
		end
	end
end

