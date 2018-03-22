


--- Help Files
require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 

----Update the Wood Pipe Images
require ("prototypes.Wood_Products.pipes")
--- Update the Rail Images


require ("prototypes.Wood_Products.wooden_rail_bridge_update")
--- Bridge Rail Remnants
require ("prototypes.Wood_Products.update_bridge_rails_remnants")
require ("prototypes.Wood_Products.tint_rails_remnants_function")

	-- Concrete Rail
	---- Update Standard Rails to use and look like concrete
	set_tint_to_rails ({
	data.raw["straight-rail"]["straight-rail"],
	data.raw["curved-rail"]["curved-rail"]}, 
	{r = 183/255, g = 183/255, b = 183/255, a = 1}) -- concrete
	
	set_tint_to_remnants ({
	data.raw["rail-remnants"]["straight-rail-remnants"],
	data.raw["rail-remnants"]["curved-rail-remnants"]}, 
	{r = 183/255, g = 183/255, b = 183/255, a = 1}) -- concrete

	-- Wood Rail
	set_tint_to_rails ({
	data.raw["straight-rail"]["bi-straight-rail-wood"],
	data.raw["curved-rail"]["bi-curved-rail-wood"]}, 
	{r = 183/255, g = 125/255, b = 62/255, a = 1}) -- wood
	
	set_tint_to_remnants ({
	data.raw["rail-remnants"]["straight-rail-remnants-wood"],
	data.raw["rail-remnants"]["curved-rail-remnants-wood"]}, 
	{r = 183/255, g = 125/255, b = 62/255, a = 1}) -- wood


	
-- vanilla rail recipe update
thxbob.lib.recipe.remove_ingredient ("rail", "iron-stick")
thxbob.lib.recipe.add_new_ingredient("rail", {type="item", name="concrete", amount=8})
thxbob.lib.recipe.add_new_ingredient("rail", {type="item", name="small-electric-pole", amount=1})



-- vanilla rail icon & images update
data.raw["straight-rail"]["straight-rail"].icon = "__Bio_Industries__/graphics/icons/straight-rail-concrete.png"
data.raw["curved-rail"]["curved-rail"].icon = "__Bio_Industries__/graphics/icons/curved-rail-concrete.png"
--data.raw["rail-planner"]["rail"].icon = "__Bio_Industries__/graphics/icons/rail-concrete.png"
data.raw["rail-planner"]["rail"].icon = "__Bio_Industries__/graphics/icons/rail-concrete-power.png"


--- Wood Rail added to Tech 
thxbob.lib.tech.add_recipe_unlock("railway", "bi-rail-wood")
thxbob.lib.tech.add_recipe_unlock("railway", "bi-rail-wood-bridge")	
	
--- If Bob, move Vanilla Rail to Rail 2.
if data.raw.technology["bob-railway-2"] then
	thxbob.lib.tech.remove_recipe_unlock ("railway", "rail")
	thxbob.lib.tech.add_recipe_unlock("bob-railway-2", "rail")
end

	
-- Damage Bonus to Ammo
-- Don't duplicate what NE does

if not mods["Natural_Evolution_Buildings"] then
	require("prototypes.Bio_Turret.technology-updates")
end

if not mods["Natural_Evolution_Buildings"] and BI.Settings.Bio_Cannon then
	-- Don't duplicate what NE does
	if not mods["Natural_Evolution_Buildings"] then
		require("prototypes.Bio_Cannon.technology-updates")
	end
	-- add Prototype Artillery as pre req for artillery
	thxbob.lib.tech.add_prerequisite("artillery", "Bio_Cannon")
end

--- Move Stone Crusher up in tech tree
thxbob.lib.tech.add_recipe_unlock("automation", "bi-stone-crusher")
thxbob.lib.tech.add_recipe_unlock("automation", "bi-crushed-stone")


-- Add Large Wooden Chest
thxbob.lib.tech.add_recipe_unlock("logistics-2", "bi_large_wooden_chest")


---- Game Tweaks ----
if BI.Settings.BI_Recipe_Tweaks then
	--- Concrete Recipe Tweak
	thxbob.lib.recipe.remove_ingredient ("concrete", "iron-ore")
	thxbob.lib.recipe.add_new_ingredient ("concrete", {type="item", name="iron-stick", amount=2})
	--- Stone Wall
	thxbob.lib.recipe.add_new_ingredient ("stone-wall", {type="item", name="iron-stick", amount=1})


	--- Rail
	if data.raw.item["stone-crushed"] then
		thxbob.lib.recipe.remove_ingredient ("rail", "stone")
		thxbob.lib.recipe.add_new_ingredient ("rail", {type="item", name="stone-crushed", amount=6})
		thxbob.lib.recipe.remove_ingredient ("bi-rail-wood", "stone")
		thxbob.lib.recipe.add_new_ingredient ("bi-rail-wood", {type="item", name="stone-crushed", amount=6})
	end

		--- Trees Give Random 1 - 6 Raw Wood.
	for _, tree in pairs(data.raw["tree"]) do
   --CHECK FOR SINGLE RESULTS
   if tree.minable and tree.minable.result then
      --CHECK FOR VANILLA TREES RAW WOOD x 4
      if tree.minable.result == "raw-wood" and tree.minable.count == 4 then
         tree.minable = {mining_particle = "wooden-particle", mining_time = 1.5, results = {{type = "item", name = "raw-wood", amount_min = 1, amount_max = 6}}}
      end
   else
      --CHECK FOR RESULTS TABLE
      if tree.minable and tree.minable.results then
         for k, results in pairs(tree.minable.results) do
            --CHECK FOR RESULT RAW-WOOD x 4
            if results.name == "raw-wood" and results.amount == 4 then
               results.amount = nil
               results.amount_min = 1
               results.amount_max = 6
            end
         end      
      end
   end
end
	
	-- Make Steel Axe use Iron Axe as an upgrade
	thxbob.lib.recipe.remove_ingredient ("steel-axe", "iron-stick")
	thxbob.lib.recipe.add_new_ingredient ("steel-axe", {type="item", name="iron-axe", amount=1})
	
	--- Loot Picup	
	if data.raw.player.player.loot_pickup_distance < 4 then
		data.raw.player.player.loot_pickup_distance = 4 -- default 2
	end	

	--- Run Speed
	if data.raw.player.player.running_speed < 0.15 then
		data.raw.player.player.running_speed = 0.25 -- default 0.15
	end		
	
	--- Disassemble of Burner Miner Drill and Steel Furnace
	require("prototypes.Bio_Tweaks.recipe")
	thxbob.lib.tech.add_recipe_unlock("advanced-material-processing", "bi_steel_furnace_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_burner_mining_drill_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_stone_furnace_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_burner_inserter_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_long_handed_inserter_disassemble")
	
end



--- Wood Floors
data.raw.item["wood"].place_as_tile =
	{
		result = "bi-wood-floor",
		condition_size = 4,
		condition = { "water-tile" }
	}
	
	-- Add Big and Huge electric poles to tech tree
thxbob.lib.tech.add_recipe_unlock ("logistics", "bi-big-wooden-pole")
thxbob.lib.tech.add_recipe_unlock ("electric-energy-distribution-2", "bi_huge_wooden_pole")
	

--- Make it so that the Base game tile "grass" can't be placed in blueprints
--- New as of 0.16
data.raw["tile"]["grass-1"].can_be_part_of_blueprint = false
data.raw["tile"]["grass-2"].can_be_part_of_blueprint = false
data.raw["tile"]["grass-3"].can_be_part_of_blueprint = false
data.raw["tile"]["grass-4"].can_be_part_of_blueprint = false

if mods["alien-biomes"] then

	data.raw["tile"]["frozen-snow-0"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-7"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-8"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-9"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-blue-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-blue-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-green-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-green-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-green-grass-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-green-grass-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-mauve-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-mauve-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-olive-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-olive-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-orange-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-orange-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-purple-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-purple-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-red-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-red-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-turquoise-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-turquoise-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-violet-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-violet-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-yellow-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-yellow-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-blue-heat-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-blue-heat-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-blue-heat-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-blue-heat-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-green-heat-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-green-heat-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-green-heat-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-green-heat-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-orange-heat-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-orange-heat-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-orange-heat-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-orange-heat-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-purple-heat-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-purple-heat-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-purple-heat-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-purple-heat-4"].can_be_part_of_blueprint = false

end


--- Adds Solar Farm, Solar Plant, Musk Floor, Bio Accumulator and Substation to Tech tree
if BI.Settings.BI_Solar_Additions then
	if data.raw.technology["bob-solar-energy-2"] then
		
		thxbob.lib.tech.add_recipe_unlock("bob-electric-energy-accumulators-2", "bi_accumulator")
		thxbob.lib.tech.add_recipe_unlock("electric-energy-distribution-2", "bi_large_substation")
		thxbob.lib.tech.add_recipe_unlock("bob-solar-energy-2", "bi_bio_Solar_Farm")
		thxbob.lib.tech.add_recipe_unlock("bob-solar-energy-2", "bi_solar_mat")
		thxbob.lib.tech.add_recipe_unlock("bob-solar-energy-2", "bi_Solar_Boiler_panel")
		
	else

		thxbob.lib.tech.add_recipe_unlock("electric-energy-accumulators-1", "bi_accumulator")
		thxbob.lib.tech.add_recipe_unlock("electric-energy-distribution-2", "bi_large_substation")
		thxbob.lib.tech.add_recipe_unlock("solar-energy", "bi_bio_Solar_Farm")
		thxbob.lib.tech.add_recipe_unlock("solar-energy", "bi_solar_mat")
		thxbob.lib.tech.add_recipe_unlock("solar-energy", "bi_Solar_Boiler_panel")
		
	end	
end


--- Changes fertiliser recipes if bob's
if data.raw.item["sodium-hydroxide"] then

	thxbob.lib.recipe.add_new_ingredient ("bi-fertiliser-2", {type="item", name="sodium-hydroxide", amount=10})
	thxbob.lib.tech.add_recipe_unlock("bi-fertiliser", "bi-fertiliser-2")
	
end	
	
if BI.Settings.BI_Bio_Fuel or mods["Natural_Evolution_Buildings"] then

	require("prototypes.Bio_Farm.technology2")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-Clean_Air2")
	
end

-- Adds Bio recipes
if BI.Settings.BI_Bio_Fuel then 

	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-bioreactor")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-cellulose-1")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-cellulose-2")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass-1")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass-2")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass-3")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-battery")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass_conversion-1")	
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass_conversion-2")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass_conversion-3")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-acid")	
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bio_boiler")

	if mods["angelspetrochem"] then
		thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-sulfur_angels")	
	else
		thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-sulfur")	
	end
	
	thxbob.lib.recipe.add_new_ingredient("bi-adv-fertiliser-1", {type="fluid", name="bi-biomass", amount=10})
	thxbob.lib.recipe.add_new_ingredient("bi-adv-fertiliser-2", {type="fluid", name="bi-biomass", amount=10})
	
end

--update crushed stone icon
data.raw.item["stone-crushed"].icon = "__Bio_Industries__/graphics/icons/crushed-stone.png"
	
	
--- Make Bio Farm use glass if Bob's
if data.raw.item.glass  then
	thxbob.lib.recipe.replace_ingredient("bi_bio_farm", "copper-cable", "glass")
end
	

	
--- if the Alien Artifact is in the game, use if for some recipes
if data.raw.item["alien-artifact"] then
	--- Advanced Fertiliser will use Alien Artifact
	thxbob.lib.recipe.add_new_ingredient("bi-adv-fertiliser-1", {type="item", name="alien-artifact", amount=5})
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-adv-fertiliser-1")	
end	


------- Adds a Mk3 recipe for wood if you're playing with Natural Evolution Buildings
if mods["Natural_Evolution_Buildings"] then

		
	thxbob.lib.recipe.remove_ingredient ("bi-adv-fertiliser-1", "alien-artifact")
	thxbob.lib.recipe.add_new_ingredient ("bi-adv-fertiliser-1", {type="fluid", name="NE_enhanced-nutrient-solution", amount=50})

end
	

if BI.Settings.Bio_Cannon and mods["Natural_Evolution_Buildings"]then

	------- Changes Bio Cannon Recipe
	thxbob.lib.recipe.remove_ingredient ("Bio_Cannon", "advanced-circuit")
	thxbob.lib.recipe.remove_ingredient ("Bio_Cannon", "steel-plate")
	thxbob.lib.recipe.add_new_ingredient ("Bio_Cannon", {type="item", name="Building_Materials", amount=30})

end


------------ Changing order/sorting/groups
if BI.Settings.BI_Solar_Additions and data.raw["item"]["solar-panel-large-3"] and data.raw["item-subgroup"]["bob-energy-solar-panel"] then 
	
	data.raw["item"]["bi_bio_Solar_Farm"].subgroup = "bob-energy-solar-panel"
	data.raw["item"]["bi_bio_Solar_Farm"].order="d[solar-panel]-x[bi_bio_Solar_Farm]"	
	data.raw["item"]["bi-solar-mat"].subgroup = "bob-energy-solar-panel"

end


------------ Changing order/sorting/groups
if data.raw["item-subgroup"]["bob-energy-accumulator"] and BI.Settings.BI_Solar_Additions then 
	
	data.raw["item"]["bi_accumulator"].subgroup = "bob-energy-accumulator"
	data.raw["item"]["bi_accumulator"].order="e[accumulator]-a[accumulator]-x"	
	data.raw["item"]["bi-large-substation"].subgroup = "bob-energy-accumulator"
	
end


if data.raw["item-subgroup"]["bob-fluid"] then 
	
	if BI.Settings.BI_Bio_Fuel and mods["Natural_Evolution_Buildings"] then
		data.raw["recipe"]["bi-biomass_conversion-1"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi-biomass_conversion-1"].order = "b[fluid-chemistry]-a[coal-cracking]-z[bi-Fuel_Conversion-1]"	
		data.raw["recipe"]["bi-biomass_conversion-2"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi-biomass_conversion-2"].order = "b[fluid-chemistry]-a[coal-cracking]-z[bi-Fuel_Conversion-2]"	
		data.raw["recipe"]["bi-biomass_conversion-3"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi-biomass_conversion-3"].order = "b[fluid-chemistry]-a[coal-cracking]-z[bi-Fuel_Conversion-3]"		
		data.raw["recipe"]["bi-plastic-1"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-plastic-1"].order = "g[plastic-bar-1]"
		data.raw["recipe"]["bi-plastic-2"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-plastic-2"].order = "g[plastic-bar-2]"
		data.raw["recipe"]["bi-cellulose-1"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-cellulose-1"].order = "g[cellulose-1]"
		data.raw["recipe"]["bi-cellulose-2"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-cellulose-2"].order = "g[cellulose-2]"
	end
	
end

if data.raw["item-subgroup"]["bob-material"] then 

	data.raw["recipe"]["bi-charcoal"].subgroup = "bob-material"
	data.raw["recipe"]["bi-charcoal-2"].subgroup = "bob-material"
	data.raw["recipe"]["bi-coal"].subgroup = "bob-material"
	data.raw["recipe"]["bi-coal-2"].subgroup = "bob-material"
	data.raw["recipe"]["bi-coke-coal"].subgroup = "bob-material"
	data.raw["recipe"]["bi-ash"].subgroup = "bob-material"
	data.raw["recipe"]["bi-ash-2"].subgroup = "bob-material"
	data.raw["recipe"]["bi-woodpulp"].subgroup = "bob-material"
	data.raw["recipe"]["bi-crushed-stone"].subgroup = "bob-material"

end


if data.raw["item-subgroup"]["pipe"] then 

	data.raw["item"]["bi-wood-pipe"].subgroup = "pipe"
	data.raw["item"]["bi-wood-pipe"].order = "a[pipe]-a[pipe]-1-0"	
	data.raw["item"]["bi-pipe-to-ground-wood"].subgroup = "pipe-to-ground"
	data.raw["item"]["bi-pipe-to-ground-wood"].order = "a[pipe]-b[pipe-to-ground]-1-0"	
	
end



------------ Support for Bob's Greenhouse
if data.raw["item"]["bob-greenhouse"] then 

	data.raw["item"]["seedling"].place_result="seedling"
	data.raw["item"]["seedling"].icon = "__Bio_Industries__/graphics/icons/Seedling.png"
	data.raw["item"]["fertiliser"].icon = "__Bio_Industries__/graphics/icons/fertiliser_32.png"
	
	if mods["alien-biomes"] then
		data.raw["item"]["fertiliser"].place_as_tile = {result = "vegetation-green-grass-3",	condition_size = 1,	condition = { "water-tile" }}
	else
		data.raw["item"]["fertiliser"].place_as_tile = {result = "grass-3",	condition_size = 1,	condition = { "water-tile" }}
	end
		
end

	

-------- Use Alternative Solar Farm Image
if BI.Settings.BI_Solar_Additions and settings.startup["BI_Alt_Solar_Farm_Image"] and settings.startup["BI_Alt_Solar_Farm_Image"].value then


	data.raw["lamp"]["bi_bio_Solar_Farm_Image"].icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon_alt.png"
	data.raw["solar-panel"]["bi_bio_Solar_Farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon_alt.png"
	data.raw["item"]["bi_bio_Solar_Farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon_alt.png"


	data.raw["lamp"]["bi_bio_Solar_Farm_Image"].picture_off =
		{
		  filename = "__Bio_Industries__/graphics/entities/bio_solar_farm/Bio_Solar_Farm_On_alt.png",
		  priority = "low",
		  width = 208,
		  height = 192,
		  frame_count = 1,
		  direction_count = 1,
		  scale = 3/2,
		}



	data.raw["lamp"]["bi_bio_Solar_Farm_Image"].picture_on =
		{
		  filename = "__Bio_Industries__/graphics/entities/bio_solar_farm/Bio_Solar_Farm_On_alt.png",
		  priority = "low",
		  width = 208,
		  height = 192,
		  frame_count = 1,
		  direction_count = 1,
		  scale = 3/2,
		}



	data.raw["solar-panel"]["bi_bio_Solar_Farm"].picture =
		{
		  filename = "__Bio_Industries__/graphics/entities/bio_solar_farm/Bio_Solar_Farm_On_alt.png",
		  priority = "low",
		  width = 208,
		  height = 192,
		  frame_count = 1,
		  direction_count = 1,
		  scale = 3/2,
		}


	
end


-------- Use Alternative Solar Farm Image
if settings.startup["BI_Alt_Farm_Image"] and settings.startup["BI_Alt_Farm_Image"].value then


	data.raw["assembling-machine"]["bi_bio_farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon_alt.png"
	data.raw["lamp"]["bi_light_for_Bio_Farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon_alt.png"
	data.raw["item"]["bi_bio_farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon_alt.png"
	data.raw["recipe"]["bi_bio_farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon_alt.png"
	
	data.raw["assembling-machine"]["bi_bio_farm"].animation =
		{
			filename = "__Bio_Industries__/graphics/entities/biofarm/Bio_Farm_Idle_alt.png",
			priority = "high",
			width = 320,
			height = 320,
			frame_count = 1,
			shift = {0.75, 0},
		}



	data.raw["assembling-machine"]["bi_bio_farm"].working_visualisations =
		{

			animation =
			{
				filename = "__Bio_Industries__/graphics/entities/biofarm/Bio_Farm_Working_alt.png",
				priority = "high",
				width = 320,
				height = 320,
				frame_count = 1,
				shift = {0.75, 0},
			},
		}


	data.raw["lamp"]["bi_light_for_Bio_Farm"].picture_off =
		{
			  filename = "__Bio_Industries__/graphics/entities/biofarm/Bio_Farm_Idle.png",
			  priority = "low",
			  width = 0,
			  height = 0,
			  frame_count = 1,
			  axially_symmetrical = false,
			  direction_count = 1,
			  shift = {0.75, 0},
		}



	data.raw["lamp"]["bi_light_for_Bio_Farm"].picture_on =
			{
			  filename = "__Bio_Industries__/graphics/entities/biofarm/Bio_Farm_Idle.png",
			  priority = "low",
			  width = 0,
			  height = 0,
			  frame_count = 1,
			  axially_symmetrical = false,
			  direction_count = 1,
			  shift = {0.75, 0},
			}


	
end


--[[	
	-- Obsolete??
------- DyTech Support (Might be outdated....)
if BI_Config.mod.DyTechCore then

require("prototypes.Bio_Farm.dytech_recipe")
		
	thxbob.lib.tech.add_recipe_unlock("bi_bio_farming", "bi-resin")
	thxbob.lib.tech.add_recipe_unlock("bi-fertiliser", "bi-resin_Mk2")
	thxbob.lib.tech.add_recipe_unlock("bi_bio_farming", "bi-sulfur-wood")
	thxbob.lib.tech.add_recipe_unlock("bi-fertiliser", "bi-sulfur-wood_Mk2")

	
	if data.raw.item["sulfur-seed"].stack_size < 400 then
	data.raw.item["sulfur-seed"].stack_size = 400
	end

	if data.raw.item["sulfur-wood"].stack_size < 400 then
	data.raw.item["sulfur-wood"].stack_size = 400
	end

	if data.raw.item["rubber-seed"].stack_size < 400 then
	data.raw.item["rubber-seed"].stack_size = 400
	end

	--- If you're using NE Buildings, add an advanced recipe
	if mods["Natural_Evolution_Buildings"] then
		thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-resin_Mk3")
		thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-sulfur-wood_Mk3")
		thxbob.lib.recipe.add_new_ingredient ("bi-resin_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})
		thxbob.lib.recipe.add_new_ingredient ("bi-sulfur-wood_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})

	end

end
]]

	