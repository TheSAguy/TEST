-- tunneling biter

require("prototypes.biters.common")

local tint = {r = 0.7, g = 0.5, b = 0.4, a = 1}

for size, sizeMod in pairs(sizes) do
  local bi = table.deepcopy(data.raw.unit[size .. "-biter"])
  bi.name = PREFIX .. size .. "-tunneler-biter"
  bi.type = "unit"

  -- tint sprite
  tintSprite(bi, tint)

  -- add corpse
  bi.corpse = PREFIX .. size .. "-tunneler-biter-corpse"
  extendCorpse(bi.corpse, size, tint)

  data:extend {bi}
end
