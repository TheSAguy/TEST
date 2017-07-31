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
	

})