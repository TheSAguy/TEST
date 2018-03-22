--Bio_Industries Version   2.2.1
local QC_Mod = true
require ("util")
require ("libs/util_ext")
require ("stdlib/event/event")
require ("control_tree")
require ("control_bio_cannon")



--------------------------------------------------------------------

local function On_Init()
	
	if global.Bio_Cannon_Table ~= nil then
		Event.register(defines.events.on_tick, function(event) end)
	end
	
	if global.bi == nil then
		global.bi = {}
		global.bi.tree_growing = {}
		global.bi.terrains = {}
	end
	
	
	global.bi.seed_bomb={}
	global.bi.seed_bomb["seedling"] = "seedling"
	global.bi.seed_bomb["seedling-2"] = "seedling-2"
	global.bi.seed_bomb["seedling-3"] = "seedling-3"

	
	if global.Arboretum_Table == nil then
		global.Arboretum_Table = {}
	end
	
	-- enable researched recipes
	for i, force in pairs(game.forces) do
		force.reset_technologies()
		force.reset_recipes()
	end

	
	
end

--------------------------------------------------------------------			 
local function On_Load()

	if global.Bio_Cannon_Table ~= nil then
		Event.register(defines.events.on_tick, function(event) end)
	end
	
end


--------------------------------------------------------------------
local function On_Config_Change()

	
	if global.Bio_Cannon_Table ~= nil then
		Event.register(defines.events.on_tick, function(event) end)
	end
	
	if global.bi == nil then
		global.bi = {}
		global.bi.tree_growing = {}
		global.bi.terrains = {}
	end

	if global.Arboretum_Table == nil then
		global.Arboretum_Table = {}
	end
	
	
	global.bi.seed_bomb={}
	global.bi.seed_bomb["seedling"] = "seedling"
	global.bi.seed_bomb["seedling-2"] = "seedling-2"
	global.bi.seed_bomb["seedling-3"] = "seedling-3"


	-- enable researched recipes
	for i, force in pairs(game.forces) do
		for _, tech in pairs(force.technologies) do
			if tech.researched then
				for _, effect in pairs(tech.effects) do
					if effect.type == "unlock-recipe" then          
						force.recipes[effect.recipe].enabled = true
					end
				end
			end
		end
	end
	
end

--------------------------------------------------------------------

--- Used for some compatibility with Angels Mods
script.on_event(defines.events.on_player_joined_game, function(event)
   local player = game.players[event.player_index]
   local force = player.force
   local techs = force.technologies
   
	if settings.startup["angels-use-angels-barreling"] and settings.startup["angels-use-angels-barreling"].value then
      techs['fluid-handling'].researched = false
      techs['bi-fertiliser'].reload()
      local _t = techs['angels-fluid-barreling'].researched
      techs['angels-fluid-barreling'].researched = false
      techs['angels-fluid-barreling'].researched = _t
   end
   
end)



---------------------------------------------
script.on_event(defines.events.on_trigger_created_entity, function(event)
	--- Used for Seed-bomb 
	local ent=event.entity
	local surface = ent.surface
	local position = ent.position
	
	-- Basic
    if global.bi.seed_bomb[ent.name] == "seedling" then
		writeDebug("Seed Bomb Activated - Basic")
		seed_planted_trigger (event)

	
	-- Standard
    elseif global.bi.seed_bomb[ent.name] == "seedling-2" then
		writeDebug("Seed Bomb Activated - Standard")
		local terrain_name_s
		if game.active_mods["alien-biomes"] then 
			terrain_name_s = "vegetation-green-grass-3"
		else
			terrain_name_s = "grass-3"
		end

		writeDebug(terrain_name_s)
		
		surface.set_tiles{{name=terrain_name_s, position=position}}
		seed_planted_trigger (event)


		
	-- Advanced
    elseif global.bi.seed_bomb[ent.name] == "seedling-3" then
		writeDebug("Seed Bomb Activated - Advanced")
		local terrain_name_a
		if game.active_mods["alien-biomes"] then 
			terrain_name_a = "vegetation-green-grass-1"
		else
			terrain_name_a = "grass-1"
		end	
		writeDebug(terrain_name_a)	
		
		surface.set_tiles{{name=terrain_name_a, position=position}}
		seed_planted_trigger (event)

    end
	
end)




--------------------------------------------------------------------
local function On_Built(event)
    local entity = event.created_entity
   	local surface = entity.surface
	local force = entity.force
	local position = entity.position
   
	--- Seedling planted
	if entity.valid and entity.name == "seedling" then
		seed_planted (event)
	end
	
    --- Bio Farm has been built
	if entity.valid and entity.name == "bi_bio_farm" then
	writeDebug("Bio Farm has been built")
		   
		local b_farm = entity
		local pole_name = "bi_medium-electric-pole_for_Bio_Farm"  
		local panel_name = "bi_solar-panel_for_Bio_Farm"  
		local lamp_name = "bi_light_for_Bio_Farm"      
		  
		local create_pole = surface.create_entity({name = pole_name, position = position, force = force})
		local create_panel = surface.create_entity({name = panel_name, position = position, force = force})
		local create_lamp = surface.create_entity({name = lamp_name, position = position, force = force})
		  
		create_pole.minable = false
		create_pole.destructible = false
		create_panel.minable = false
		create_panel.destructible = false
		create_lamp.minable = false
		create_lamp.destructible = false
		
		group_entities(cantor(position.x,position.y), { b_farm, create_pole, create_panel, create_lamp })	  

	end

	
	--- Bio Solar Boiler / Solar Plant has been built
	if entity.valid and entity.name == "bi-Solar-Boiler-panel" then
	writeDebug("Bio Solar Boiler has been built")
		   
		local solar_plant = entity
		local boiler_solar = "bi-solar-boiler"   		
		local sm_pole_name = "bi_solar_pole"  
		
		local create_solar_boiler = surface.create_entity({name = boiler_solar, position = position, force = force})
		local create_sm_pole = surface.create_entity({name = sm_pole_name, position = position, force = force})
		
		create_solar_boiler.minable = false
		create_solar_boiler.destructible = false	
 		create_sm_pole.minable = false
		create_sm_pole.destructible = false
			
		group_entities(cantor(position.x,position.y), { solar_plant, create_solar_boiler, create_sm_pole })	  

	end
	
	-- Power Rail - 

	--- Concrete Rail has been built
	if (entity and entity.name == "straight-rail") or (entity and entity.name == "curved-rail") then
	writeDebug("Concrete Rail has been built")
		local surface = entity.surface
		local force = entity.force
		local position = entity.position		   
		local rail_track = entity
		local pole_name = "bi_medium-electric-pole_for_rail"  		
		
		local create_rail_pole = surface.create_entity({name = pole_name, position = position, force = force})
				
		create_rail_pole.minable = false
		create_rail_pole.destructible = false 
		
		group_entities(cantor(position.x,position.y), { rail_track, create_rail_pole })	  

	end

		
	--- Bio Cannon has been built
	if entity.valid and entity.name == "Bio_Cannon_Area" then
	
	
	local New_Bio_Cannon
	local New_Bio_CannonR
	
	writeDebug("Bio Cannon has been built")				

		New_Bio_Cannon  = surface.create_entity({name = "Bio_Cannon", position = position, direction = event.created_entity.direction, force = force})
		New_Bio_CannonR = surface.create_entity({name = "Bio_Cannon_r", position = position, direction = event.created_entity.direction, force = force})

		New_Bio_Cannon.health = event.created_entity.health
		
		event.created_entity.destroy()
	
		
		New_Bio_CannonR.operable = false
		New_Bio_CannonR.destructible = false
		New_Bio_CannonR.minable = false
		
		if global.Bio_Cannon_Table == nil then
			global.Bio_Cannon_Table = {}
			Event.register(defines.events.on_tick, function(event) end)
		end

		table.insert(global.Bio_Cannon_Table, {New_Bio_Cannon,New_Bio_CannonR,0})
		
	end

	
    --- Arboretum has been built
	if entity.valid and entity.name == "bi-Arboretum" then
	writeDebug("Arboretum has been built")
		   
		local arboretum = entity
		local radar_name = "bi-Arboretum-Radar"  
		
		local position_c = {position.x - 4, position.y + 3.95}
		local create_radar = surface.create_entity({name = radar_name, position = position_c, force = force})

		  
		create_radar.minable = false
		create_radar.destructible = false

		global.Arboretum_Table[entity.unit_number] = {inventory=entity, radar=create_radar }
  
	    writeDebug("The inventory # is: "..entity.unit_number)
		writeDebug("The radar # is: "..create_radar.unit_number)
	end



	
end


--------------------------------------------------------------------
local function On_Remove(event)
	
	local entity = event.entity	
	
	--- Bio Farm has been removed
   	if entity.valid and entity.name == "bi_bio_farm" then
	writeDebug("Bio Farm has been removed")
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

		
			
	--- Bio Solar Farm has been removed
   	if entity.valid and entity.name == "bi_bio_Solar_Farm" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end


		--- Bio Solar Boiler has been removed
   	if entity.valid and entity.name == "bi-Solar-Boiler-panel" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end
	
	
	--- Solar Mat has been removed
   	if entity.valid and entity.name == "bi-solar-mat" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

		
	
	--- Seedling Removed
	if entity.valid and entity.name == "seedling" then
	
		for k, v in pairs(global.bi.tree_growing) do
			if v.position.x == entity.position.x and v.position.y == entity.position.y then
				table.remove(global.bi.tree_growing, k)
				return
			end
		end

	end
	
			-- Power Rail - 
		
	--- Concrete Rail has been removed
   	if (entity and entity.name == "straight-rail") or (entity and entity.name == "curved-rail") then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

	
		--- Arboretum has been removed
   	if entity.valid and entity.name == "bi-Arboretum" then
		writeDebug("Arboretum has been removed")
	
		global.Arboretum_Table[entity.unit_number].radar.destroy()
		global.Arboretum_Table[entity.unit_number] = nil
		
	end

		
end


--------------------------------------------------------------------
local function On_Death(event)

	local entity = event.entity
	
	--- Bio Farm has been destroyed
   	if entity.valid and entity.name == "bi_bio_farm" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    --vx.die()
					vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

		--- Bio Solar Farm has been destroyed
   	if entity.valid and entity.name == "bi_bio_Solar_Farm" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end


			--- Bio Solar Boiler has been removed
   	if entity.valid and entity.name == "bi-Solar-Boiler-panel" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end
	
	--- Seedling Removed
	
	if entity.valid and entity.name == "seedling" then
	
		for k, v in pairs(global.bi.tree_growing) do
			if v.position.x == entity.position.x and v.position.y == entity.position.y then
				table.remove(global.bi.tree_growing, k)
				return
			end
		end

	end
	
	
		-- Power Rail - 

	--- Concrete Rail has been destroyed
   	if (entity and entity.name == "straight-rail") or (entity and entity.name == "curved-rail") then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

		--- Arboretum has been destroyed
   	if entity.valid and entity.name == "bi-Arboretum" then
	writeDebug("Arboretum has been destroyed")
	
		global.Arboretum_Table[entity.unit_number].radar.destroy()
		global.Arboretum_Table[entity.unit_number] = nil

	end
	
end

function Get_Arboretum_Recipe(ArboretumTable, event)
		

		if ArboretumTable == nil then
			global.Arboretum_Table = {}
			return
		else

			local recipe = ArboretumTable.inventory.get_recipe()
			
			if recipe ~= nil then
			
			
			
			local recipe_name = ArboretumTable.inventory.get_recipe().name
			
					
				if recipe_name == "bi_Arboretum_r1" then
				
					writeDebug(recipe_name..": Just plant a tree")
					local pos = ArboretumTable.inventory.position
					local surface = ArboretumTable.inventory.surface					

					for k = 1,10 do
					
						local xxx = math.random(-15, 15)
						local yyy = math.random(-15, 15)
						local new_position = {x = pos.x + xxx,y = pos.y + yyy}
						local can_be_placed = surface.can_place_entity{name= "seedling", position = new_position, force = "neutral"}
							
						if can_be_placed then 
							
							local create_seedling = surface.create_entity({name = "seedling", position = new_position, force = "neutral"})
							
							entity = create_seedling	
							seed_planted_arboretum (event, entity)
							
							break
							
						else
						
							writeDebug("can't plant here")
							writeDebug(k)
							
						end
					end
					
					
				elseif recipe_name == "bi_Arboretum_r2" then
				
					writeDebug(recipe_name..": Just change terrain to grass - 3 (basic)")
					local pos = ArboretumTable.inventory.position
					local surface = ArboretumTable.inventory.surface
					
					for k = 1,10 do
					
						local xxx = math.random(-15, 15)
						local yyy = math.random(-15, 15)
						local new_position = {x = pos.x + xxx,y = pos.y + yyy}
						local currentTilename = surface.get_tile(new_position.x, new_position.y).name
								
						if Bi_Industries.fertility[currentTilename] then
						

							local terrain_name_s
							if game.active_mods["alien-biomes"] then 
								terrain_name_s = "vegetation-green-grass-3"
							else
								terrain_name_s = "grass-3"
							end
								
							surface.set_tiles{{name=terrain_name_s, position=new_position}}
							break
							
						else	
						
							writeDebug("can't change here")
							
						end
					
					end
					
				elseif recipe_name == "bi_Arboretum_r3" then
				

					writeDebug(recipe_name..": Just change terrain to grass - 1 (advanced)")
					local pos = ArboretumTable.inventory.position
					local surface = ArboretumTable.inventory.surface					
					
					for k = 1,10 do
					
						local xxx = math.random(-15, 15)
						local yyy = math.random(-15, 15)
						local new_position = {x = pos.x + xxx,y = pos.y + yyy}
						local currentTilename = surface.get_tile(new_position.x, new_position.y).name
								
						if Bi_Industries.fertility[currentTilename] then
						
							local terrain_name_s
							if game.active_mods["alien-biomes"] then 
								terrain_name_s = "vegetation-green-grass-31"
							else
								terrain_name_s = "grass-1"
							end
								
							surface.set_tiles{{name=terrain_name_s, position=new_position}}
							break
							
						else	
						
							writeDebug("can't change here")	
							
						end
					
					end
					
				elseif recipe_name == "bi_Arboretum_r4" then
				
					writeDebug(recipe_name..": Plant Tree and change the terrain to grass - 3 (basic)")
					local pos = ArboretumTable.inventory.position
					local surface = ArboretumTable.inventory.surface					

					for k = 1,10 do
										
						local xxx = math.random(-15, 15)
						local yyy = math.random(-15, 15)
						local new_position = {x = pos.x + xxx,y = pos.y + yyy}
						local currentTilename = surface.get_tile(new_position.x, new_position.y).name
						local can_be_placed = surface.can_place_entity{name= "seedling", position = new_position, force = "neutral"}
							
						if can_be_placed and Bi_Industries.fertility[currentTilename] then 
						
							local terrain_name
							if game.active_mods["alien-biomes"] then 
								terrain_name = "vegetation-green-grass-3"
							else
								terrain_name = "grass-3"
							end
							
							surface.set_tiles{{name=terrain_name, position=new_position}}			
							local create_seedling = surface.create_entity({name = "seedling", position = new_position, force = "neutral"})				
							entity = create_seedling	
							seed_planted_arboretum (event, entity)
							break
								
						else	
						
							writeDebug("can't plant or change terrain here")
							
						end
						
					end
					
					
				elseif recipe_name == "bi_Arboretum_r5" then
				
					writeDebug(recipe_name..": Plant Tree and change the terrain to grass - 1 (advanced)")
					local pos = ArboretumTable.inventory.position
					local surface = ArboretumTable.inventory.surface					
					
					for k = 1,10 do
										
						local xxx = math.random(-15, 15)
						local yyy = math.random(-15, 15)
						local new_position = {x = pos.x + xxx,y = pos.y + yyy}
						local currentTilename = surface.get_tile(new_position.x, new_position.y).name
						local can_be_placed = surface.can_place_entity{name= "seedling", position = new_position, force = "neutral"}
							
						if can_be_placed and Bi_Industries.fertility[currentTilename] then 
						
							local terrain_name
							if game.active_mods["alien-biomes"] then 
								terrain_name = "vegetation-green-grass-1"
							else
								terrain_name = "grass-1"
							end
							
							surface.set_tiles{{name=terrain_name, position=new_position}}			
							local create_seedling = surface.create_entity({name = "seedling", position = new_position, force = "neutral"})				
							entity = create_seedling	
							seed_planted_arboretum (event, entity)
							break
								
						else	
						
							writeDebug("can't plant or change terrain here")
							
						end
						
					end
					
				else
				
					writeDebug("no recipe")
					
				end
			
			end		

		end

		  
		  
end


----------------Radars Scanning Function, used by Terraformer  -----------------------------
script.on_event(defines.events.on_sector_scanned, function(event)
	
	---- Each time a Arboretum-Radar scans a sector  ----	
	if event.radar.name == "bi-Arboretum-Radar" then
		--writeDebug("The Unit # is: "..event.radar.unit_number)
		
		local num = (event.radar.unit_number-1)
		
		--writeDebug("The Inventory is located in # is: "..num)

		Get_Arboretum_Recipe(global.Arboretum_Table[num], event) 
		
	end

	
end)


----- Solar Mat stuff
--------------------------------------------------------------------
local function Solar_Mat (event, surface)

	for i, vv in ipairs(event.tiles) do
		local position = vv.position
		local currentTilename = surface.get_tile(position.x,position.y).name
		
		if currentTilename == "bi-solar-mat" then
			writeDebug("Solar Mat has been built")
			
			local force = event.force
			local solar_mat = surface.get_tile(position.x,position.y)
			local sm_pole_name = "bi_solar_pole"  
			local sm_panel_name = "bi_solar-panel_for_Solar-Mat"  
			  
			local create_sm_pole = surface.create_entity({name = sm_pole_name, position = {position.x + 0.5, position.y + 0.5}, force = force})
			local create_sm_panel = surface.create_entity({name = sm_panel_name, position = {position.x + 0.5, position.y + 0.5}, force = force})
			  
			create_sm_pole.minable = false
			create_sm_pole.destructible = false
			create_sm_panel.minable = false
			create_sm_panel.destructible = false
		
		else	
		
			local radius = 0.5
			local area = {{position.x - radius, position.y - radius}, {position.x + radius, position.y + radius}}
			writeDebug("NOT Solar Mat")
			local entities = surface.find_entities(area)
			local entity1 = entities[1]
			entity1 = surface.find_entities_filtered{area=area, name="bi_solar_pole", limit=1}
				
			if entity1 then 		
			
				for _, o in pairs(surface.find_entities_filtered({area = area, name = "bi_solar_pole"})) do o.destroy() end	

				writeDebug("bi_solar_pole Removed")
			else
				writeDebug("bi_solar_pole not found")				
			end
				
			--- Remove the Hidden Solar Panel		
			local entity2 = entities[1]
			entity2 = surface.find_entities_filtered{area=area, name="bi_solar-panel_for_Solar-Mat", limit=1}	
			
			if entity2 then 
					
				for _, o in pairs(surface.find_entities_filtered({area = area, name = "bi_solar-panel_for_Solar-Mat"})) do o.destroy() end	

				writeDebug("bi_solar-panel_for_Solar-Mat Removed")
			else
				writeDebug("bi_solar-panel_for_Solar-Mat not found")				
			end


			
		end
	end	

end


local function Player_Tile_Built(event)

	local player = game.players[event.player_index]
	local surface = player and player.surface


	if event.tiles then Solar_Mat (event, surface) end

	
end

	
local function Robot_Tile_Built(event)


	local robot = event.robot
	local surface = robot.surface
	
	-- fix #2 Error while running event Bio_Industries::on_robot_built_tile
	if surface == nil then
		return
	end
	
	if event.tiles then Solar_Mat (event, surface) end

end


--------------------------------------------------------------------
local function solar_mat_removed_at(surface, position)
   local radius = 0.5
   local area = {{position.x - radius, position.y - radius}, {position.x + radius, position.y + radius}}
   local n = 0
   for _,o in next,surface.find_entities_filtered{name='bi_solar_pole',area=area} or {}
      do o.destroy() n = n+1 end
   --writedebug(string.format('%g bi_solar_poles removed',n))
   for _,o in next,surface.find_entities_filtered{name='bi_solar-panel_for_Solar-Mat',area=area} or {}
      do o.destroy() n = n+1 end
   --writedebug(string.format('bi_solar-panel_for_Solar-Mat',n))
   end

local function Player_Tile_Remove(event)
   local player = game.players[event.player_index]
   if event.item_stack.name == 'bi-solar-mat' and player.mining_state.mining then
     -- writedebug(string.format('%g solar mats removed',event.item_stack.count))
      return solar_mat_removed_at(player.surface, player.mining_state.position)
      end
   end


local function Robot_Tile_Remove(event)
   local robot = event.robot 
   if event.item_stack.name == 'bi-solar-mat' then
     -- writedebug(string.format('%g solar mats removed',event.item_stack.count))
      return solar_mat_removed_at(robot.surface,robot.position)
      end
   end
--------------------------------------------------------------------



script.on_load(On_Load)
script.on_configuration_changed(On_Config_Change)
script.on_init(On_Init)


local build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
script.on_event(build_events, On_Built)

local pre_remove_events = {defines.events.on_pre_player_mined_item, defines.events.on_robot_pre_mined}
script.on_event(pre_remove_events, On_Remove)

local death_events = {defines.events.on_entity_died}
script.on_event(death_events, On_Death)

local player_build_event = {defines.events.on_player_built_tile}
script.on_event(player_build_event, Player_Tile_Built)

local robot_build_event = {defines.events.on_robot_built_tile}
script.on_event(robot_build_event, Robot_Tile_Built)

local remove_events = {defines.events.on_player_mined_item}
script.on_event(remove_events, Player_Tile_Remove)

local remove_events = {defines.events.on_robot_mined}
script.on_event(remove_events, Robot_Tile_Remove)



--------------------------------------------------------------------
--- DeBug Messages 
--------------------------------------------------------------------
function writeDebug(message)
	if QC_Mod == true then 
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end

