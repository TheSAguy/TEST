data:extend({
  

	--- Bio Ammo
	{
		type = "recipe",
		name = "Biological-bullet-magazine",
		category = "crafting-with-fluid",
		
		normal =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
				{"piercing-rounds-magazine", 10},
				{type="fluid", name="NE_alien_toxin", amount=10}
			},
		  result = "Biological-bullet-magazine",
		  result_count = 5,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"piercing-rounds-magazine", 12},
				{type="fluid", name="NE_alien_toxin", amount=15}
			},
		  result = "Biological-bullet-magazine",
		  result_count = 4,
		},
	}, 	
	
		--- Copper Ammo
	{
		type = "recipe",
		name = "copper_bullets",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/copper_magazine.png",
		normal =
		{
			enabled = false,
			energy_required = 1,
			ingredients = 
			{
				{"copper-plate", 8},

			},
		  result = "copper-bullet-magazine",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 2,
			ingredients = 
			{
				{"copper-plate", 10},
			},
		  result = "copper-bullet-magazine",
		  result_count = 1,
		},
	}, 	
	
			--- piercing-rounds-magazine from Copper Ammo
	{
		type = "recipe",
		name = "piercing_magazine_copper",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/piercing_magazine_copper.png",
		order = "a[basic-clips]-b1[piercing-rounds-magazine]",
		normal =
		{
			enabled = false,
			energy_required = 3,
			ingredients = 
			{
			  {"copper-bullet-magazine", 1},
			  {"steel-plate", 1},
			  {"copper-plate", 8}
			},
		  result = "piercing-rounds-magazine",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
			  {"copper-bullet-magazine", 1},
			  {"steel-plate", 1},
			  {"copper-plate", 10}
			},
		  result = "piercing-rounds-magazine",
		  result_count = 1,
		},
	}, 	
	
	--- Conversion Ammo Copper
	{
		type = "recipe",
		name = "ne_conversion_ammo_copper",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_ammo_copper.png",
		order = "x1[basic-clips]-b[piercing-rounds-magazine]-d[ne-conversion-ammo]",
		normal =
		{
			enabled = true,
			energy_required = 3,
			ingredients = 
			{
			  {"copper-bullet-magazine", 10},
			  {"alien-artifact", 1},
			},
		  result = "ne-conversion-ammo",
		  result_count = 10,
		},
		expensive =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
			  {"copper-bullet-magazine", 10},
			  {"alien-artifact", 1},
			},
		  result = "ne-conversion-ammo",
		  result_count = 10,
		},
	}, 	
	
		--- Conversion Ammo Iron
	{
		type = "recipe",
		name = "ne_conversion_ammo_iron",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/ne_ammo_iron.png",
		order = "x2[basic-clips]-b[piercing-rounds-magazine]-d[ne-conversion-ammo]",
		normal =
		{
			enabled = true,
			energy_required = 3,
			ingredients = 
			{
			  {"firearm-magazine", 10},
			  {"alien-artifact", 1},
			},
		  result = "ne-conversion-ammo",
		  result_count = 10,
		},
		expensive =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
			  {"firearm-magazine", 10},
			  {"alien-artifact", 1},
			},
		  result = "ne-conversion-ammo",
		  result_count = 10,
		},
	}, 	
	
	---- Bio Land Mine
	{
		type = "recipe",
		name = "bio_land_mine",
		category = "crafting-with-fluid",
		normal =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
				{"land-mine", 5},
				{type="fluid", name="NE_alien_toxin", amount=15}
			},
		  result = "bio_land_mine",
		  result_count = 5,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"land-mine", 5},
				{type="fluid", name="NE_alien_toxin", amount=20}
			},
		  result = "bio_land_mine",
		  result_count = 4,
		},
	}, 	
	
	--- Long Range Turret
  {
    type = "recipe",
    name = "NE_gun_turret",
    	
	normal =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
			  {"iron-gear-wheel", 10},
			  {"gun-turret", 1},
			  {"steel-plate", 10}
			},
		  result = "NE-gun-turret",
		  result_count = 1,
		},
	
		expensive =
		{
			enabled = false,
			energy_required = 16,
			ingredients = 
			{
			  {"iron-gear-wheel", 10},
			  {"gun-turret", 2},
			  {"steel-plate", 10}
			},
		  result = "NE-gun-turret",
		  result_count = 1,
		},
	

  },
	
	
	--- Basic Dart
	{
		type = "recipe",
		name = "basic_dart_magazine",
		
		normal =
		{
			enabled = true,
			energy_required = 5,
			ingredients = 
			{
				{"raw-wood", 5},
			},
		  result = "basic-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
				{"raw-wood", 5},
			},
		  result = "basic-dart-magazine",
		  result_count = 8,
		},
	}, 	
	
		--- Enhanced Dart
	{
		type = "recipe",
		name = "enhanced_dart_magazine",
		--category = "crafting-with-fluid",
		
		normal =
		{
			enabled = true,
			energy_required = 5,
			ingredients = 
			{
				{"raw-wood", 5},
				{"copper-plate", 5},
			},
		  result = "enhanced-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
				{"raw-wood", 5},
				{"copper-plate", 5},
			},
		  result = "enhanced-dart-magazine",
		  result_count = 8,
		},
	}, 	


	--- Conversion Turret
  {
    type = "recipe",
    name = "bio_turret",
    	
	normal =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
			  {"iron-gear-wheel", 5},
			  {"raw-wood", 20},
			},
		  result = "bio-turret",
		  result_count = 1,
		},
	
		expensive =
		{
			enabled = true,
			energy_required = 16,
			ingredients = 
			{
			  {"iron-gear-wheel", 10},
			  {"raw-wood", 25},
			},
		  result = "bio-turret",
		  result_count = 1,
		},
	

  },
	
	
	
	
	
})