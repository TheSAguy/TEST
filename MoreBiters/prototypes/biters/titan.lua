-- tank biter

require("prototypes.biters.common")

local tint = {r = 0.6, g = 0.6, b = 1, a = 1.0}

local size = "behemoth"
local bi = table.deepcopy(data.raw.unit[size .. "-biter"])
bi.name = PREFIX .. size .. "-titan-biter"
bi.type = "unit"

-- tint sprite
tintSprite(bi, tint)
scaleSprite(bi, 1.7)

-- slow and strong
bi.movement_speed = 0.04
bi.max_health = 100000
bi.attack_parameters.ammo_type.action.action_delivery.target_effects.damage.amount = 10000 -- instakill
bi.attack_parameters.cooldown = 150 -- slow attack
bi.resistances = {
  {
    decrease = 5,
    percent = 95, -- almost immune to physical attacks, else snipers could one-shot it
    type = "physical"
  },
  {
    decrease = 5,
    percent = 80,
    type = "explosion"
  },
  {
    decrease = 5,
    percent = 80,
    type = "fire"
  },
  {
    decrease = 5,
    percent = 80,
    type = "laser"
  }
}

bi.collision_box = {
  {
    -0.8,
    -0.8
  },
  {
    0.8,
    0.8
  }
}

-- add corpse
bi.corpse = PREFIX .. size .. "-titan-biter-corpse"
extendCorpse(bi.corpse, size, tint, 1.7)

data:extend {bi}

-- achievement
data:extend({
  {
    icon = "__MoreBiters__/graphics/achievements/titanSpawn.png",
    icon_size = 128,
    name = PREFIX .. "here-comes-daddy",
    order = "a",
    type = "achievement",
    limited_to_one_game = true
  },
  {
    icon = "__MoreBiters__/graphics/achievements/titanKill.png",
    icon_size = 128,
    name = PREFIX .. "king-slayer",
    order = "b",
    type = "achievement",
    limited_to_one_game = true
  }
})
