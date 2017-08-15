
require("prototypes.Wood_Products.demo-railpictures-wood")
require("prototypes.Wood_Products.demo-remnants-wood")


rail_pictures_w = function()
  return rail_pictures_internal_w({{"metals", "metals", mipmap = true},
                                 {"backplates", "backplates", mipmap = true},
                                 {"ties", "ties", variations = 3},
                                 {"stone_path", "stone-path", variations = 3},
                                 {"stone_path_background", "stone-path-background", variations = 3}})
end



pipepictures_w = function()
  return {
    straight_vertical_single =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 80,
      height = 80,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-vertical-single.png",
        priority = "extra-high",
        width = 160,
        height = 160,
        scale = 0.5
      }
    },
    straight_vertical =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-vertical.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    straight_vertical_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-vertical-window.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    straight_horizontal_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-horizontal-window.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    straight_horizontal =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-straight-horizontal.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    corner_up_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-corner-up-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    corner_up_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-corner-up-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    corner_down_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-corner-down-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    corner_down_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-corner-down-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    t_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-t-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    t_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-t-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    t_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-t-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    t_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
         filename = "__base__/graphics/entity/pipe/hr-pipe-t-left.png",
         priority = "extra-high",
         width = 128,
         height = 128,
         scale = 0.5
      }
    },
    cross =
    {
      filename = "__base__/graphics/entity/pipe/pipe-cross.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-cross.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    ending_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-ending-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
      },
    ending_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-ending-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    ending_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-ending-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    ending_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-ending-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    horizontal_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-horizontal-window-background.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    vertical_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 64,
      height = 64,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-pipe-vertical-window-background.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    fluid_background =
    {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 32,
      height = 20,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-fluid-background.png",
        priority = "extra-high",
        width = 64,
        height = 40,
        scale = 0.5
      }
    },
    low_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    gas_flow =
    {
      filename = "__base__/graphics/entity/pipe/steam.png",
      priority = "extra-high",
      line_length = 10,
      width = 24,
      height = 15,
      frame_count = 60,
      axially_symmetrical = false,
      direction_count = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/pipe/hr-steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        axially_symmetrical = false,
        direction_count = 1
      }
    }
  }
end





data:extend({

---- Wood Floor
	{
	  type = "tile",
	  name = "bi-wood-floor",
	  needs_correction = false,
	  minable = {hardness = 0.2, mining_time = 0.5, result = "wood"},
	  mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
	  collision_mask = {"ground-tile"},
	  walking_speed_modifier = 1.2,
	  layer = 62,
	  decorative_removal_probability = 0.4,
	  variants =
	  {
		main =
		{
		  {
			picture = "__Bio_Industries__/graphics/entities/wood_products/wood1.png",
			count = 4,
			size = 1
		  },
		  {
			picture = "__Bio_Industries__/graphics/entities/wood_products/wood2.png",
			count = 1,
			size = 2,
			probability = 1,
		  },
		},
		inner_corner =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-inner-corner.png",
		  count = 8
		},
		outer_corner =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-outer-corner.png",
		  count = 8
		},
		side =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-side.png",
		  count = 8
		},
		u_transition =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-u.png",
		  count = 8
		},
		o_transition =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-o.png",
		  count = 1
		}
	  },
	  walking_sound =
	  {
		{
		  filename = "__base__/sound/walking/concrete-01.ogg",
		  volume = 1.2
		},
		{
		  filename = "__base__/sound/walking/concrete-02.ogg",
		  volume = 1.2
		},
		{
		  filename = "__base__/sound/walking/concrete-03.ogg",
		  volume = 1.2
		},
		{
		  filename = "__base__/sound/walking/concrete-04.ogg",
		  volume = 1.2
		}
	  },
	  map_color={r=139, g=115, b=85},
	  ageing=0,
	  vehicle_friction_modifier = dirt_vehicle_speed_modifer
	},
	
	---- Big Wooden Pole
	
	  {
    type = "electric-pole",
    name = "bi-big-wooden-pole",
    icon = "__Bio_Industries__/graphics/icons/big-wooden-pole.png",
    flags = {"placeable-neutral", "player-creation"},
	minable = {hardness = 0.2, mining_time = 0.5, result = "bi-big-wooden-pole"},
    max_health = 150,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 100
      },
	  {
        type = "physical",
        percent = 10
      }
    },
    collision_box = {{-0.3,-0.3}, {0.3,0.3}},
    selection_box = {{-0.5,-0.5}, {0.5,0.5}},
    drawing_box = {{0,0}, {0,0}},
    maximum_wire_distance = 24,
    supply_area_distance = 0,
    pictures =
    
		{
      filename = "__Bio_Industries__/graphics/entities/wood_products/big-wooden-pole-01.png",
      priority = "high",
      width = 180,
      height = 180,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {2.2, -2.5}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {3.3, -0.1},
          green = {3.3, -0.2},
          red = {3.3, -0.3}
        },
        wire =
        {
          copper = {0.7, -4.3},
          green = {0.7,-4.3},
          red = {0.7,-4.3}
        }
      }
    },
    copper_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    green_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12
    },
    red_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    wire_shadow_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    }
  },

  ---- Wood Fence

 {
    type = "wall",
    name = "bi-wooden-fence",
    icon = "__Bio_Industries__/graphics/icons/wooden-fence.png",
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.29, -0.09}, {0.29, 0.49}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 1, result = "bi-wooden-fence"},
    fast_replaceable_group = "wall",
    max_health = 150,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
   
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "impact",
        decrease = 15,
        percent = 20
      }
      
    },
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-single-1.png",
            priority = "extra-high",
            width = 7,
            height = 46,
            shift = {0, -0.15625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-single-shadow.png",
            priority = "extra-high",
            width = 38,
            height = 25,
            shift = {0.459375, 0.75},
            draw_as_shadow = true
          }
        }
      },
      straight_vertical =
      {
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-1.png",
              priority = "extra-high",
              width = 7,
              height = 53,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 39,
              height = 66,
              shift = {0.490625, 1.425},
              draw_as_shadow = true
            }
          }
        },
       {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-1.png",
              priority = "extra-high",
             width = 7,
              height = 53,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 39,
              height = 66,
              shift = {0.490625, 1.425},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-1.png",
              priority = "extra-high",
              width = 7,
              height = 53,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 39,
              height = 66,
              shift = {0.490625, 1.425},
              draw_as_shadow = true
            }
          }
        }
      },
      straight_horizontal =
      {
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-1.png",
              priority = "extra-high",
              width = 34,
              height = 47,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 84,
              height = 28,
              shift = {0.421875, 0.85},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-2.png",
              priority = "extra-high",
              width = 34,
              height = 47,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 84,
              height = 28,
              shift = {0.421875, 0.85},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-3.png",
              priority = "extra-high",
              width = 34,
              height = 47,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 84,
              height = 28,
              shift = {0.421875, 0.85},
              draw_as_shadow = true
            }
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-corner-right-down.png",
            priority = "extra-high",
            width = 23,
            height = 53,
            shift = {0.248125, -0.07625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-corner-right-down-shadow.png",
            priority = "extra-high",
            width = 52,
            height = 56,
            shift = {0.724375, 1.30625},
            draw_as_shadow = true
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-corner-left-down.png",
            priority = "extra-high",
            width = 21,
            height = 53,
            shift = {-0.248125, -0.07625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-corner-left-down-shadow.png",
            priority = "extra-high",
            width = 60,
            height = 56,
            shift = {0.128125, 1.30625},
            draw_as_shadow = true
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-t-down.png",
            priority = "extra-high",
            width = 34,
            height = 53,
            shift = {0, -0.07625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-t-down-shadow.png",
            priority = "extra-high",
            width = 71,
            height = 55,
            shift = {0.286875, 1.280625},
            draw_as_shadow = true
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-ending-right.png",
            priority = "extra-high",
            width = 23,
            height = 47,
            shift = {0.248125, -0.15625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-ending-right-shadow.png",
            priority = "extra-high",
            width = 49,
            height = 27,
            shift = {0.684375, 0.85},
            draw_as_shadow = true
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-ending-left.png",
            priority = "extra-high",
            width = 21,
            height = 47,
            shift = {-0.248125, -0.15625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-ending-left-shadow.png",
            priority = "extra-high",
            width = 63,
            height = 27,
            shift = {0.128125, 0.85},
            draw_as_shadow = true
          }
        }
      }
    }
  },

  --------------- Rail

    {
    type = "straight-rail",
    name = "bi-straight-rail-wood",   
	icon = "__Bio_Industries__/graphics/icons/straight-rail-wood.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.5, result = "bi-rail-wood"},
    max_health = 60,
    corpse = "straight-rail-remnants-wood",
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    rail_category = "regular",
    --pictures = rail_pictures_w(),
	pictures = rail_pictures(),
  },
  {
    type = "curved-rail",
    name = "bi-curved-rail-wood",   
	icon = "__Bio_Industries__/graphics/icons/curved-rail-wood.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.5, result = "bi-rail-wood", count = 4},
    max_health = 120,
    corpse = "curved-rail-remnants-wood",
    collision_box = {{-0.75, -0.55}, {0.75, 1.6}},
    secondary_collision_box = {{-0.65, -2.43}, {0.65, 2.43}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    rail_category = "regular",
    --pictures = rail_pictures_w(),
	pictures = rail_pictures(),
	placeable_by = { item="bi-rail-wood", count = 4}
  },

  --Wooden rail for Bridge
  {
    type = "straight-rail",
    name = "bi-straight-rail-wood-bridge",   
	icon = "__Bio_Industries__/graphics/icons/straight-rail-wood.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
	collision_mask = { "object-layer", "not-colliding-with-itself" },
    minable = {mining_time = 0.5, result = "bi-rail-wood-bridge"},
    max_health = 60,
    corpse = "straight-rail-remnants-wood",
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    rail_category = "regular",
    pictures = rail_pictures_w(),
  },
  {
    type = "curved-rail",
    name = "bi-curved-rail-wood-bridge",   
	icon = "__Bio_Industries__/graphics/icons/rail-wood.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
	collision_mask = { "object-layer", "not-colliding-with-itself" },
    minable = {mining_time = 0.5, result = "bi-rail-wood-bridge", count = 4},
    max_health = 120,
    corpse = "curved-rail-remnants-wood",
    collision_box = {{-0.75, -0.55}, {0.75, 1.6}},
    secondary_collision_box = {{-0.65, -2.43}, {0.65, 2.43}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    rail_category = "regular",
    pictures = rail_pictures_w(),
	placeable_by = { item="bi-rail-wood-bridge", count = 4}
  },

 
	---- Wood Pipe
 {
    type = "pipe",
    name = "bi-wood-pipe",
    icon = "__Bio_Industries__/graphics/icons/wood_pipe.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "bi-wood-pipe"},
    max_health = 100,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 20
      },
      {
        type = "impact",
        percent = 30
      }
    },
    fast_replaceable_group = "pipe",
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_connections =
      {
        { position = {0, -1} },
        { position = {1, 0} },
        { position = {0, 1} },
        { position = {-1, 0} }
      },
    },
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures = pipepictures_w(),
	--pictures = pipe_pictures,
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/pipe.ogg",
          volume = 0.85
        },
      },
      match_volume_to_activity = true,
      max_sounds_per_type = 3
    },

    horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
  },


{
    type = "pipe-to-ground",
    name = "bi-pipe-to-ground-wood",
    icon = "__Bio_Industries__/graphics/icons/pipe-to-ground-wood.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "bi-pipe-to-ground-wood"},
    max_health = 150,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 20
      },
      {
        type = "impact",
        percent = 40
      }

    },
    collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, -1} },
        {
          position = {0, 1},
          max_underground_distance = 10
        }
      },
    },
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      up =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.10, -0.04}
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-up.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      down =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.05, 0}
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-down.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      left =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {-0.12, 0.1}
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-left.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
      right =
      {
        filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
        priority = "high",
        width = 64,
        height = 64, --, shift = {0.1, 0.1}
        hr_version =
        {
           filename = "__base__/graphics/entity/pipe-to-ground/hr-pipe-to-ground-right.png",
           priority = "extra-high",
           width = 128,
           height = 128,
           scale = 0.5
        }
      },
    },
  },

 
  --- Not Implemented ---
  ------- Rail Pole - Hidden
  {
    type = "electric-pole",
    name = "bi_medium-electric-pole_for_rail",
    icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Cabeling.png",
	flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-repairable", "not-on-map"},
	selectable_in_game = false,
    max_health = 1,
    resistances = {{type = "fire", percent = 100}},
    collision_box = {{-0, -0}, {0, 0}},
	collision_mask = {},
    maximum_wire_distance = 8,
    supply_area_distance = 5,
 
    pictures =
    {
      filename = "__Bio_Industries__/graphics/icons/empty.png",
      priority = "low",
      width = 0,
      height = 0,
	  frame_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
	  shift = {0.75, 0},
    },
	 connection_points =
    {
      {
        shadow =
        {

        },
        wire =
        {
          copper_wire_tweak = {-0, -0},

        }
      },
      {
        shadow =
        {

        },
        wire =
        {
          copper_wire_tweak = {-0, -0},

        }
      },
      {
        shadow =
        {

        },
        wire =
        {
          copper_wire_tweak = {-0, -0},

        }
      },
      {
        shadow =
        {

        },
        wire =
        {
          copper_wire_tweak = {-0, -0},

        }
      }
    },
	--[[
    connection_points =
    {
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      }
    },
	]]
	
    radius_visualisation_picture =
    {
      filename = "__Bio_Industries__/graphics/icons/empty.png",
      width = 0,
      height = 0,
      priority = "low"
    },
  },

})
