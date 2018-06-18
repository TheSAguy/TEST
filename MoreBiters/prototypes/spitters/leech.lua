-- fire spitter

require("prototypes.spitters.common")

local tint = {r = 1, g = 1, b = 0.4, a = 1}

for size, sizeMod in pairs(sizes) do
  local sp = table.deepcopy(data.raw.unit[size .. "-spitter"])

  sp.name = PREFIX .. size .. "-leech-spitter"
  sp.type = "unit"

  -- flamethrower attack
  sp.attack_parameters.ammo_category = "combat-robot-beam"
  sp.attack_parameters.ammo_type = {
      action = {
        action_delivery = {
          beam = "electric-beam",
          duration = 5,
          max_length = 15,
          source_offset = {
            0.15,
            -0.5
          },
          type = "beam"
        },
        type = "direct"
      },
      category = "combat-robot-beam"
    }
  sp.attack_parameters.cooldown = 20
  sp.attack_parameters.range = 15
  sp.attack_parameters.type = "beam"

  -- change sprite
  tintSprite(sp, tint)

  -- add corpse
  sp.corpse = PREFIX .. size .. "-leech-spitter-corpse"
  extendCorpse(sp.corpse, size, tint)

  data:extend {sp}

  -- add the drain
  local drain = table.deepcopy(data.raw["electric-energy-interface"]["hidden-electric-energy-interface"])
  drain.name = PREFIX .. size .. "-leech-drain"
  drain.type = "electric-energy-interface"
  drain.energy_source = {
    type = "electric",
    buffer_capacity = ((sizeMod.damage / 5)^2) .. "MJ",
    usage_priority = "primary-input",
    input_flow_limit = "999999999MW",
    output_flow_limit = "0W",
    drain = (sizeMod.damage / 3)^2 .. "MW" -- 4MW, 16MW, 36MW, 100MW 
  }
  drain.localised_name = nil
  drain.icon = "__base__/graphics/icons/" .. size .. "-spitter.png"
  drain.collision_mask = {}
  data:extend {drain}
end
