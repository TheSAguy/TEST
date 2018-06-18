-- mimic biter
-- doesn't spawn normally, only from trees

require("prototypes.biters.common")

local tint = {r = 0, g = 0, b = 0, a = 0.5}

for size, sizeMod in pairs(sizes) do
  local bi = table.deepcopy(data.raw.unit[size .. "-biter"])
  bi.name = PREFIX .. size .. "-mimic-biter"
  bi.type = "unit"

  -- tint sprite
  tintSprite(bi, tint)

  -- fast, strong, tough... all around terrifying
  bi.movement_speed = 0.33
  bi.max_health = bi.max_health * 3
  local dmg = bi.attack_parameters.ammo_type.action.action_delivery.target_effects.damage 
  dmg.amount = dmg.amount*5

  -- never stop chasing
  bi.max_pursue_distance = 9999999

  -- add corpse
  bi.corpse = PREFIX .. size .. "-mimic-biter-corpse"
  extendCorpse(bi.corpse, size, tint)

  data:extend {bi}
end
