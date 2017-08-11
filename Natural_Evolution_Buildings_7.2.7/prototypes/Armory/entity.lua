



if settings.startup["NE_Difficulty"] and settings.startup["NE_Difficulty"].value then

	NE_Difficulty = settings.startup["NE_Difficulty"].value
else
	NE_Difficulty = 1
end

Bio_Ammo_Damage = settings.startup["NE_Bio_Ammo_Damage"].value

require ("util")


--- Bio Ammo
data:extend({


	--- Biological Bullet
	{
		type = "ammo",
		name = "Biological-bullet-magazine",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/Biological-bullet-magazine.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "bullet",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot"
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  
				 damage = { amount = ((Bio_Ammo_Damage + 10)/NE_Difficulty) + NE_Difficulty, type = "Biological"}
				 
				},
				{
				  type = "damage",
				  damage = { amount = 5 , type = "physical"}
				}
			  }
			}
		  }
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "a[basic-clips]-b[piercing-rounds-magazine]-c[Biological-bullet-magazine]",
		stack_size = 200
  },
  

	--- Copper Bullet
	{
		type = "ammo",
		name = "copper-bullet-magazine",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/copper_magazine.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "bullet",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				  type = "create-explosion",
				  entity_name = "explosion-gunshot"
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit"
				},
				{
				  type = "damage",
				  damage = { amount = 4 , type = "physical"}
				},
				{
				  type = "damage",
				  damage = { amount = 1 , type = "bob-pierce"}
				}
			  }
			}
		  }
		},
		magazine_size = 12,
		subgroup = "ammo",
		order = "a[basic-clips]-aa[firearm-magazine]",
		stack_size = 200
  },

})


--- Landmine
data:extend({ 

 {
    type = "land-mine",
    name = "bio_land_mine",
    icon = "__Natural_Evolution_Buildings__/graphics/icons/bio_land_mine.png",
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid",
      "not-on-map"
    },
    minable = {mining_time = 1, result = "bio_land_mine"},
    max_health = 25,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    dying_explosion = "explosion-hit",
    picture_safe =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entity/bio_land_mine.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set =
    {
      filename = "__Natural_Evolution_Buildings__/graphics/entity/bio_land_mine_set.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 3.5,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              perimeter = 8,
              collision_mask = { "player-layer" },
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = { amount = 300, type = "explosion"}
                  },
				  {
                    type = "damage",
                    damage = { amount = 300, type = "Biological"}
                  },
                  {
                    type = "create-sticker",
                    sticker = "stun-sticker"
                  }
                }
              }
            },
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = 1000, type = "explosion"}
          },
		  {
            type = "damage",
            damage = { amount = 1000, type = "Biological"}
          }
        }
      }
    },
  },
  
  	
})

--- Turret
data:extend({ 
  {
    type = "ammo-turret",
    name = "NE-gun-turret",
    icon = "__base__/graphics/icons/gun-turret.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "NE-gun-turret"},
    max_health = 400,
    corpse = "medium-remnants",
    collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
    selection_box = {{-1, -1 }, {1, 1}},
    rotation_speed = 0.015,
    preparing_speed = 0.08,
    folding_speed = 0.08,
    dying_explosion = "medium-explosion",
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.05,
    folded_animation = 
    {
      layers =
      {
        gun_turret_extension{frame_count=1, line_length = 1},
        gun_turret_extension_mask{frame_count=1, line_length = 1},
        gun_turret_extension_shadow{frame_count=1, line_length = 1}
      }
    },
    preparing_animation = 
    {
      layers =
      {
        gun_turret_extension{},
        gun_turret_extension_mask{},
        gun_turret_extension_shadow{}
      }
    },
    prepared_animation = gun_turret_attack{frame_count=1},
    attacking_animation = gun_turret_attack{},
    folding_animation = 
    { 
      layers = 
      { 
        gun_turret_extension{run_mode = "backward"},
        gun_turret_extension_mask{run_mode = "backward"},
        gun_turret_extension_shadow{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base.png",
          priority = "high",
          width = 90,
          height = 75,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0, -0.046875},
        },
        {
          filename = "__base__/graphics/entity/gun-turret/gun-turret-base-mask.png",
          flags = { "mask" },
          line_length = 1,
          width = 52,
          height = 47,
          axially_symmetrical = false,
          direction_count = 1,
          frame_count = 1,
          shift = {0, -0.234375},
          apply_runtime_tint = true
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    
    attack_parameters =
    {
      type = "projectile",
      --ammo_category = "NE_Conversion_Ammo",
	  ammo_category = "bullet",
      cooldown = 20,  --- default 6
      projectile_creation_distance = 1.39375,
      projectile_center = {0, -0.0875}, -- same as gun_turret_attack shift
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {-0.0625, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 18,
      sound = make_heavy_gunshot_sounds(),
    },

    call_for_help_radius = 40
  },
 

})