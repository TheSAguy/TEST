-- sprinter biter

require("prototypes.biters.common")

local tint = {r = 1, g = 1, b = 0.4, a = 1}

for size, sizeMod in pairs(sizes) do
  local bi = table.deepcopy(data.raw.unit[size .. "-biter"])
  bi.name = PREFIX .. size .. "-sprinter-biter"
  bi.type = "unit"

  -- tint sprite
  tintSprite(bi, tint)

  -- just really fast
  bi.movement_speed = 0.33

  -- add corpse
  bi.corpse = PREFIX .. size .. "-sprinter-biter-corpse"
  extendCorpse(bi.corpse, size, tint)

  data:extend {bi}
end
