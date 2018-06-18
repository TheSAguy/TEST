-- modify the vanilla spawners

require("prototypes.structures.vanillaProbs")

local spawnMultipliers = {
  biter = {
    vanilla = 0.399,
    explosive = 0.15,
    tank = 0.05,
    sprinter = 0.25,
    titan = 0.001,
    tunneler = 0.15
  },
  spitter = {
    vanilla = 0.65,
    fire = 0.1,
    leech = 0.3,
    screamer = 0.05
  }
}

local function getMultSpawn(size, class, mult)
  local prob = table.deepcopy(vanillaProbs[class][size])
  for _, p in pairs(prob) do
    p[2] = p[2] * mult
  end
  return prob
end

local function isValidCombo(class, type, size)
  if (type == "tank" and size ~= "big") then -- only big tank biters
    return false
  elseif (type == "titan" and size ~= "behemoth") then
    return false
  end
  return true
end

local sizes = {"small", "medium", "big", "behemoth"}

for class, types in pairs(spawnMultipliers) do
  data.raw["unit-spawner"][class .. "-spawner"].result_units = {} -- clear old spawnrates
  for type, mult in pairs(types) do
    for _, size in pairs(sizes) do
      local name = ""
      if (type == "vanilla") then
        name = size .. "-" .. class
      else
        name = PREFIX .. size .. "-" .. type .. "-" .. class
      end
      if (isValidCombo(class, type, size)) then
        table.insert(
          data.raw["unit-spawner"][class .. "-spawner"].result_units,
          {
            name,
            getMultSpawn(size, class, mult)
          }
        )
      end
    end
  end
end
