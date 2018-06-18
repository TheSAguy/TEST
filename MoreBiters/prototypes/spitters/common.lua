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

function extendCorpse (name, size, tint) 
  local corpse = table.deepcopy(data.raw.corpse[size .. "-spitter-corpse"])
  corpse.name = name
  corpse.type = "corpse"
  for _,layer in pairs(corpse.animation.layers) do 
    layer.tint = tint
  end
  data:extend{corpse}
end