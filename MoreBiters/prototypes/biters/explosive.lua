-- explosive biter

require("prototypes.biters.common")

local tint = { r=1, g=0, b=0, a=1 }

for size,sizeMod in pairs(sizes) do
  local bi = table.deepcopy(data.raw.unit[size .. "-biter"])

  bi.name = PREFIX .. size .. "-explosive-biter"
  bi.type = "unit"

  -- change sprite
  tintSprite(bi, tint)

  -- death explosion
  if (size == "small" or size == "medium") then
    bi.dying_explosion = "big-explosion"
  else 
    bi.dying_explosion = "big-artillery-explosion"
  end

  -- add corpse
  bi.corpse = PREFIX .. size .. "-explosive-biter-corpse"
  extendCorpse(bi.corpse, size, tint)

  data:extend{bi}
end
