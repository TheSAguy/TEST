-- sprinter biter

require("prototypes.biters.common")

local tint = {r = 0.296, g = 0.84, b = 0.32, a = 1}

for size, sizeMod in pairs(sizes) do
  local bi = table.deepcopy(data.raw.unit[size .. "-biter"])
  bi.name = PREFIX .. size .. "-atomic-biter"
  bi.type = "unit"

  -- tint sprite
  tintSprite(bi, tint)

  -- strong
  local dmg = bi.attack_parameters.ammo_type.action.action_delivery.target_effects.damage 
  dmg.amount = dmg.amount*3

  -- fast
  bi.movement_speed = 0.33

  -- tough
  bi.max_health = 4000
  bi.resistances = {
    {
      decrease = 5,
      percent = 20,
      type = "physical"
    },
    {
      decrease = 5,
      percent = 50,
      type = "explosion"
    },
    {
      decrease = 5,
      percent = 20,
      type = "fire"
    },
    {
      decrease = 5,
      percent = 60,
      type = "laser"
    }
  }

  -- death explosion
  if (size == "small" or size == "medium") then
    bi.dying_explosion = "big-explosion"
  else 
    bi.dying_explosion = "big-artillery-explosion"
  end

  -- add corpse
  bi.corpse = PREFIX .. size .. "-atomic-biter-corpse"
  extendCorpse(bi.corpse, size, tint)

  data:extend {bi}
end
