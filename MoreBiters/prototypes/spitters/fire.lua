-- fire spitter

require("prototypes.spitters.common")

local tint = { r=1, g=0, b=0, a=1 }

for size,sizeMod in pairs(sizes) do
  local sp = table.deepcopy(data.raw.unit[size .. "-spitter"])

  sp.name = PREFIX .. size .. "-fire-spitter"
  sp.type = "unit"

  -- flamethrower attack
  sp.attack_parameters.ammo_category = "flamethrower"
  sp.attack_parameters.ammo_type = {
    action = {
      action_delivery = {
        stream = "flamethrower-fire-stream",
        type = "stream"
      },
      type = "direct"
    },
    category = "flamethrower"
  }
  sp.attack_parameters.cooldown = 200 / sizeMod.damage

  -- immune to fire
  sp.resistances = sp.resistances or {}
  table.insert(sp.resistances, {
    percent = 100,
    type = "fire"
  })

  -- change sprite
  tintSprite(sp, tint)

  -- add corpse
  sp.corpse = PREFIX .. size .. "-fire-spitter-corpse"
  extendCorpse(sp.corpse, size, tint)

  data:extend{sp}
end
