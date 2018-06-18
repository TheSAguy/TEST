sizes = {}

sizes["small"] = {
  damage = 10 
}
sizes["medium"] = {
  damage = 20
}
sizes["big"] = {
  damage = 30
}
sizes["behemoth"] = {
  damage = 50
}

function extendCorpse (name, size, tint, scale) 
  local corpse = table.deepcopy(data.raw.corpse[size .. "-biter-corpse"])
  corpse.name = name
  corpse.type = "corpse"
  for _,layer in pairs(corpse.animation.layers) do 
    layer.tint = tint
    layer.scale = scale
  end
  data:extend{corpse}
end