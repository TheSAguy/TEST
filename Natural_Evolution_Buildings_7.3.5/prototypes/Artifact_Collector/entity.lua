if not NE_Enemies then NE_Enemies = {} end
if not NE_Enemies.Settings then NE_Enemies.Settings = {} end

NE_Enemies.Settings.Artifact_Collector_Radius = settings.startup["NE_Artifact_Collector_Radius"].value



inv_extension2 =
{
	filename = "__Natural_Evolution_Buildings__/graphics/entities/Artifact-chest.png",
	priority = "extra-high",
	scale = 1,
	width = 60,
	height = 100,
	direction_count = 1,
	frame_count = 1,
	axially_symmetrical = false,
	shift = {0.4, -0.13}
	
}


data:extend(
	{
		{
			type = "logistic-container",
			name = "Artifact-collector",
			icon = "__Natural_Evolution_Buildings__/graphics/icons/Artifact-chest-icon.png",
			flags = {"placeable-player", "placeable-neutral", "player-creation"},
			minable = {mining_time = 0.5, result = "Artifact-collector-area"},
			render_not_in_network_icon = false,
			max_health = 150,
			corpse = "small-remnants",
			resistances = 
			{
				{
					type = "fire",
					percent = 70
				}
			},
			collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			order = "i[items]-i[Artifact-collector]",
			subgroup = "storage",
			inventory_size = 48,
			logistic_mode = "passive-provider",
			open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
			close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
			vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
			picture =
			{
				filename = "__Natural_Evolution_Buildings__/graphics/entities/Artifact-chest.png",
				priority = "extra-high",
				width = 60,
				height = 100,
				shift = {0.4, -0.13}
			}
		},
		
		---- Overlay of Pickup Range
		{
		type = "ammo-turret",
		name = "Artifact-collector-area",
		icon = "__Natural_Evolution_Buildings__/graphics/icons/Artifact-chest-icon.png",
		flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },	
		max_health = 150,
		corpse = "small-remnants",
		collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		collision_mask = { "object-layer", "not-colliding-with-itself" },
		order = "i[items]-i[Artifact-collector]",	
		automated_ammo_count = 1,
		resistances = {},	
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "bullet",
			cooldown = 2,
			range = NE_Enemies.Settings.Artifact_Collector_Radius,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,

		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension2)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension2)
                          res.run_mode = "backward"
                          return res
                       end)(),
		call_for_help_radius = 1			   

		},
	}
)