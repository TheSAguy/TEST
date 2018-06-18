-- screamer spitter
-- calls other biters to it in a huge radius until killed

require("prototypes.spitters.common")

local tint = { r=1, g=1, b=1, a=1 }

for size,sizeMod in pairs(sizes) do
  local sp = table.deepcopy(data.raw.unit[size .. "-spitter"])

  sp.name = PREFIX .. size .. "-screamer-spitter"
  sp.type = "unit"

  sp.max_health = sp.max_health * 3
  sp.call_for_help_radius = 1000
  sp.working_sound = {
    {
      filename = "__MoreBiters__/sounds/scream.ogg",
      volume = 0.7
    }
  }

  -- change sprite
  tintSprite(sp, tint)

  -- add corpse
  sp.corpse = PREFIX .. size .. "-screamer-spitter-corpse"
  extendCorpse(sp.corpse, size, tint)

  data:extend{sp}
end
