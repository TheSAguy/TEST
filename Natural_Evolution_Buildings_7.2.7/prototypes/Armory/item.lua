data:extend({


	---- Bio Land Mine
    {
		type = "item",
		name = "bio_land_mine",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/bio_land_mine.png",
		flags = {"goes-to-quickbar"},
		damage_radius = 8,
		subgroup = "gun",
		order = "g[land-mine]",
		place_result = "bio_land_mine",
		stack_size = 100,
		trigger_radius = 1.5
	},
  
  --- Conversion Turret
    {
    type = "item",
    name = "NE-gun-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "b[turret]-x[gun-turret]",
    place_result = "NE-gun-turret",
    stack_size = 50
  },
  
})
