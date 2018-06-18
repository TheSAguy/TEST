PREFIX = "more-biters-"

function tintSprite (data, tint)
  for _,layer in pairs(data.run_animation.layers) do 
    layer.tint = tint
  end
  for _,layer in pairs(data.attack_parameters.animation.layers) do
    layer.tint = tint
  end
end

function scaleSprite (data, scale)
  for _,layer in pairs(data.run_animation.layers) do 
    layer.scale = scale
  end
  for _,layer in pairs(data.attack_parameters.animation.layers) do
    layer.scale = scale
  end
end

-- biters
require("prototypes.biters.explosive")
require("prototypes.biters.tank")
require("prototypes.biters.sprinter")
require("prototypes.biters.titan")
require("prototypes.biters.mimic")
require("prototypes.biters.tunneler")
require("prototypes.biters.atomic")

-- spitters
require("prototypes.spitters.fire")
require("prototypes.spitters.leech")
require("prototypes.spitters.screamer")

-- structures
require("prototypes.structures.spawner")
require("prototypes.structures.tunnel")

-- turrets
require("prototypes.turrets.sniper")
require("prototypes.turrets.seismic")