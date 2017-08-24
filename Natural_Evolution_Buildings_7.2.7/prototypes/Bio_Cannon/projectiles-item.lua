data:extend({

	---- Hive Buster Basic Ammo
	{
		type = "ammo",
		name = "Bio_Cannon_Basic_Ammo",
		icon = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Basic_Ammo_Icon.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "Bio_Cannon_Ammo",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "Bio_Cannon_Basic_Ammo",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 85
					}
				}
			}
		},
		subgroup = "ammo",
		order = "z[Bio_Cannon_Ammo]-a[Basic]",
		stack_size = 50,
	},

	---- Poison Ammo
	{
		type = "ammo",
		name = "Bio_Cannon_Poison_Ammo",
		icon = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Poison_Ammo_Icon.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "Bio_Cannon_Ammo",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "Bio_Cannon_Poison_Ammo",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 85
					}
				}
			}
		},
		subgroup = "ammo",
		order = "z[Bio_Cannon_Ammo]-b[Poison]",
		stack_size = 50,
	},

	
	---- Hive Buster Bio Ammo
	{
		type = "ammo",
		name = "Bio_Cannon_Bio_Ammo",
		icon = "__Natural_Evolution_Buildings__/graphics/entities/bio_cannon/projectiles/Bio_Cannon_Bio_Ammo_Icon.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "Bio_Cannon_Ammo",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "Bio_Cannon_Bio_Ammo",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 85
					}
				}
			}
		},
		subgroup = "ammo",
		order = "z[Bio_Cannon_Ammo]-c[Bio]",
		stack_size = 50,
	},


	
})