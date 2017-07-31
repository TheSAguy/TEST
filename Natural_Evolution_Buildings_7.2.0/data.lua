
if not thxbob then thxbob = {} end
if not thxbob.lib then thxbob.lib = {} end

if not NE_Buildings_Config then NE_Buildings_Config = {} end
if not NE_Buildings_Config.mod then NE_Buildings_Config.mod = {} end
if not NE_Functions then NE_Functions = {} end

require ("libs.NE_Functions")
require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 
require ("libs.functions") -- From Bob's Libary 

require("prototypes.Technology.technology")
require("prototypes.Item-Groups.item-groups")
require("prototypes.Categories.recipe-category")
---------------------------------------------------------------


	--- Alien_Hatchery

require("prototypes.Alien_Hatchery.alien-artifact")
require("prototypes.Alien_Hatchery.entity")
require("prototypes.Alien_Hatchery.item")
require("prototypes.Alien_Hatchery.fluid")
require("prototypes.Alien_Hatchery.recipe")
require("prototypes.Alien_Hatchery.biters")
require("prototypes.Alien_Hatchery.spawner")
require("prototypes.Alien_Hatchery.spitters")
require("prototypes.Alien_Hatchery.worms")



---------------------------------------------------------------

	--- Alien Control Station

require("prototypes.Alien_Control_Station.entity")
require("prototypes.Alien_Control_Station.item")
require("prototypes.Alien_Control_Station.recipe")
---------------------------------------------------------------


	--- Thumper

require("prototypes.Thumper.entity")
require("prototypes.Thumper.item")
require("prototypes.Thumper.recipe")
---------------------------------------------------------------


	--- Combat Inserter

require("prototypes.Combat_Inserter.entity")
require("prototypes.Combat_Inserter.item")
require("prototypes.Combat_Inserter.recipe")
---------------------------------------------------------------


	--- Artifact Collector
require("prototypes.Artifact_Collector.entity")
require("prototypes.Artifact_Collector.item")
require("prototypes.Artifact_Collector.recipe")
---------------------------------------------------------------


    --- Armory

require("prototypes.Armory.item")
require("prototypes.Armory.recipe")
require("prototypes.Armory.entity") 
require("prototypes.Armory.damage-type") 
---------------------------------------------------------------



    --- Other - Building Materials, Attractors & Battle Marker

require("prototypes.Other.item")
require("prototypes.Other.entity") 
require("prototypes.Other.recipe")
---------------------------------------------------------------

    --- Terraforming Station
	
require("prototypes.Terraforming_Station.entity")
require("prototypes.Terraforming_Station.item")
require("prototypes.Terraforming_Station.recipe")
---------------------------------------------------------------


--- Decelerate_concrete


require("prototypes.Decelerate_concrete.entity")
require("prototypes.Decelerate_concrete.item")
require("prototypes.Decelerate_concrete.recipe")
---------------------------------------------------------------
