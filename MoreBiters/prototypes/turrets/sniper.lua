-- sniper Graphics from https://mods.factorio.com/mods/sore68/Additional-Turret

local sniper = table.deepcopy(data.raw["ammo-turret"]["gun-turret"])
sniper.name = PREFIX .. "sniper-turret"
sniper.type = "ammo-turret"

sniper.icon = "__MoreBiters__/graphics/icons/sniper.png"
sniper.automated_ammo_count = 1

function sniper_sheet(inputs)
  return {
    layers = {
      {
        filename = "__MoreBiters__/graphics/entities/sniper.png",
        priority = "medium",
        scale = 0.75,
        width = 128,
        height = 128,
        direction_count = inputs.direction_count and inputs.direction_count or 64,
        frame_count = 1,
        line_length = inputs.line_length and inputs.line_length or 8,
        axially_symmetrical = false,
        run_mode = inputs.run_mode and inputs.run_mode or "forward",
        shift = {0.35, -0.5}
      }
    }
  }
end

sniper.folded_animation = sniper_sheet({direction_count = 8, line_length = 1})
sniper.preparing_animation = sniper_sheet({direction_count = 8, line_length = 1})
sniper.prepared_animation = sniper_sheet({})
sniper.attacking_animation = sniper_sheet({})
sniper.folding_animation = sniper_sheet({direction_count = 8, line_length = 1, run_mode = "backward"})

sniper.attack_parameters = {
  type = "projectile",
  ammo_category = "bullet",
  cooldown = 600,
  projectile_creation_distance = 1.75,
  projectile_center = {0, 0},
  damage_modifier = 400,
  shell_particle = {
    name = "shell-particle",
    direction_deviation = 0.1,
    speed = 0.2,
    speed_deviation = 0.03,
    center = {0, 0},
    creation_distance = -1.925,
    starting_frame_speed = 0.2,
    starting_frame_speed_deviation = 0.1
  },
  range = 30,
  min_range = 5,
  sound = {
    {
      filename = "__MoreBiters__/sounds/sniper.ogg",
      volume = 1
    }
  }
}

sniper.minable = {
  mining_time = 0.5,
  result = PREFIX .. "sniper-turret"
}
sniper.rotation_speed = 0.002
sniper.attacking_speed = 0.5
sniper.active_energy_usage = "100KW"

local recipe = {
  type = "recipe",
  name = PREFIX .. "sniper-turret",
  enabled = false,
  energy_required = 10,
  ingredients = {
    {"gun-turret", 1},
    {"steel-plate", 30},
    {"electronic-circuit", 5}
  },
  result = PREFIX .. "sniper-turret"
}

local item = {
  type = "item",
  name = PREFIX .. "sniper-turret",
  icon = "__MoreBiters__/graphics/icons/sniper.png",
  icon_size = 32,
  flags = {"goes-to-quickbar"},
  subgroup = "defensive-structure",
  order = "b[turret]-a[" .. PREFIX .. "sniper-turret]",
  place_result = PREFIX .. "sniper-turret",
  stack_size = 50
}

local technology = {
  effects = {
    {
      recipe = PREFIX .. "sniper-turret",
      type = "unlock-recipe"
    }
  },
  icon = "__MoreBiters__/graphics/icons/sniper.png",
  icon_size = 32,
  name = PREFIX .. "sniper-turret",
  order = "a-j-b",
  prerequisites = {
    "turrets",
    "military-3"
  },
  type = "technology",
  unit = {
    count = 100,
    ingredients = {
      {
        "science-pack-1",
        1
      },
      {
        "science-pack-2",
        1
      },
      {
        "military-science-pack",
        1
      }
    },
    time = 30
  }
}

data:extend{sniper, recipe, item, technology}
