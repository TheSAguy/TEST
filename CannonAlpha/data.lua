require ("functions_turret_animation")

mod_name = "__CannonAlpha__"
entity_name = "cannon-alpha"

data:extend({
	{
	type = "ammo-turret",
	name = entity_name,
	icon = mod_name .. "/graphics/icons/"..entity_name..".png",
	flags = {"placeable-player", "player-creation"},
	minable = {mining_time = 0.5, result = entity_name},
	max_health = 400,
	corpse = "medium-remnants",
	--collision_box = {{-0.7, -0.7 }, {0.7, 0.7}},
	collision_box = {{-1.4, -1.4 }, {1.4, 1.4}},
	--selection_box = {{-1, -1 }, {1, 1}},
	selection_box = {{-1.5, -1.5 }, {1.5, 1.5}},
	rotation_speed = 0.002,
	prepare_range = 35,
	preparing_speed = 0.006,
	folding_speed = 0.006,
	dying_explosion = "medium-explosion",
	inventory_size = 1,
	automated_ammo_count = 10,
	attacking_speed = 1/2/3.75, --0.02, -- just animation
	base_picture = base_picture (),

	preparing_animation = preparing_animation(),
	prepared_animation = prepared_animation(),
	attacking_animation = attacking_animation(),
	folding_animation =folding_animation(),
	folded_animation = folded_animation(),
	
	vehicle_impact_sound =  {filename = "__base__" .. "/sound/car-metal-impact.ogg", volume = 0.65},
    
	attack_parameters =
		{
		type = "projectile",
		ammo_category = "bullet",
		cooldown = 30, -- in ticks; 60 is 1 shoot / sec
		projectile_creation_distance = 3.4, 
		projectile_center = {0,0},
		range = 34,
		sound = make_heavy_gunshot_sounds(),
		damage_modifier = 3.1
		},

	call_for_help_radius = 40
	}
})

data:extend(
{
  {
    type = "item",
    name = entity_name,
    icon = mod_name.."/graphics/icons/"..entity_name..".png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "b[turret]-a[gun-turret]-b[cannon-alpha]",
    place_result = entity_name,
    stack_size = 50
  }
}
)

data:extend(
{
  {
    type = "recipe",
    name = entity_name,
    enabled = true,
    energy_required = 8,
    ingredients =
    {
      {"iron-gear-wheel", 10},
		{"electronic-circuit", 2},
		{"submachine-gun", 1},
		{"gun-turret", 1}
    },
    result = entity_name
  }
}
)