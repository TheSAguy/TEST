-- seismic disrupter Graphics from https://mods.factorio.com/mod/logtech-beacon

local speaker = table.deepcopy(data.raw["programmable-speaker"]["programmable-speaker"])
local seismic = table.deepcopy(data.raw["electric-turret"]["laser-turret"])
seismic.name = PREFIX .. "seismic"
seismic.type = "electric-turret"
seismic.icon = "__MoreBiters__/graphics/icons/seismic.png"

seismic.minable = {
  hardness = 0.2,
  mining_time = 0.5,
  result = PREFIX .. "seismic"
}
seismic.base_picture = {
  layers = {
    {
      filename = "__MoreBiters__/graphics/entities/seismic.png",
      height = 178,
      width = 59,
      scale = 0.5,
      frame_count = 1,
      direction_count = 1,
      priority = "extra-high",
      shift = {
        -0.0625,
        -1.234375
      }
    }
  }
}
seismic.folded_animation = seismic.base_picture
seismic.prepared_animation = nil
seismic.folding_animation = nil
seismic.attacking_animation = nil
seismic.preparing_animation = nil

seismic.corpse = "small-remnants"
seismic.drawing_box = speaker.drawing_box
seismic.selection_box = speaker.selection_box
seismic.collision_box = speaker.collision_box
seismic.vehicle_impact_sound = speaker.vehicle_impact_sound
seismic.attack_parameters.ammo_type.energy_consumption = "9999999kJ" -- can't actually fire lasers
seismic.attack_parameters.range = 30
seismic.energy_source = {
  buffer_capacity = "800kJ",
  drain = "200kW",
  input_flow_limit = "9600kW",
  output_flow_limit = "0W",
  type = "electric",
  usage_priority = "primary-input"
}
seismic.working_sound = {
  sound = {
    filename = "__MoreBiters__/sounds/seismic.ogg",
    volume = 1.6
  }
}

local recipe = {
  type = "recipe",
  name = PREFIX .. "seismic",
  enabled = false,
  energy_required = 10,
  ingredients = {
    {"programmable-speaker", 1},
    {"steel-plate", 15},
    {"electronic-circuit", 10}
  },
  result = PREFIX .. "seismic"
}

local item = {
  type = "item",
  name = PREFIX .. "seismic",
  icon = "__MoreBiters__/graphics/icons/seismic.png",
  icon_size = 32,
  flags = {"goes-to-quickbar"},
  subgroup = "defensive-structure",
  order = "a[" .. PREFIX .. "seismic]",
  place_result = PREFIX .. "seismic",
  stack_size = 50
}

local technology = {
  effects = {
    {
      recipe = PREFIX .. "seismic",
      type = "unlock-recipe"
    }
  },
  icon = "__MoreBiters__/graphics/icons/seismic.png",
  icon_size = 32,
  name = PREFIX .. "seismic",
  order = "a-j-b",
  prerequisites = {
    "circuit-network",
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
data:extend {seismic, recipe, item, technology}
