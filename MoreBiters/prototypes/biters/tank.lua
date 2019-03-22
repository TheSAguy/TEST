-- tank biter

require("prototypes.biters.common")

local tint = {r = 0.6, g = 0.6, b = 1, a = 1.0}
local size = "big"
local bi = table.deepcopy(data.raw.unit[size .. "-biter"])
bi.name = PREFIX .. size .. "-tank-biter"
bi.type = "unit"

-- tint sprite
tintSprite(bi, tint)

-- really tough
bi.max_health = 6000
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

-- add corpse
bi.corpse = PREFIX .. size .. "-tank-biter-corpse"
extendCorpse(bi.corpse, size, tint)

data:extend {bi}
