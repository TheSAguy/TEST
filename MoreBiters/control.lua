--control.lua

VERSION = "1.3.0"
PREFIX = "more-biters-"

deathExplosions = {}
deathExplosions[PREFIX .. "small-explosive-biter"] = {radius = 1, damage = 50}
deathExplosions[PREFIX .. "medium-explosive-biter"] = {radius = 2, damage = 100}
deathExplosions[PREFIX .. "big-explosive-biter"] = {radius = 3, damage = 200}
deathExplosions[PREFIX .. "behemoth-explosive-biter"] = {radius = 4, damage = 300}
deathExplosions[PREFIX .. "small-atomic-biter"] = {radius = 2, damage = 100}
deathExplosions[PREFIX .. "medium-atomic-biter"] = {radius = 3, damage = 200}
deathExplosions[PREFIX .. "big-atomic-biter"] = {radius = 4, damage = 400}
deathExplosions[PREFIX .. "behemoth-atomic-biter"] = {radius = 5, damage = 600}

local sizes = {"small", "medium", "big", "behemoth"}

function isExplosiveBiter(entity)
  return deathExplosions[entity.name] ~= nil
end

function isTitanBiter(entity)
  return entity.name == PREFIX .. "behemoth-titan-biter"
end

function isLeechSpitter(entity)
  return string.match(entity.name, "leech%-spitter")
end

function isTunnelerBiter(entity)
  return string.match(entity.name, "tunneler%-biter") or string.match(entity.name, "atomic%-biter")
end

function isTree(entity)
  return string.match(entity.name, "tree")
end

function isSeismic(entity)
  return entity.name == PREFIX .. "seismic"
end

function noSeismic(pos)
  for ent, _ in pairs(global[PREFIX .. "seismic"]) do
    if (ent.valid) then
      local distance = (ent.position.x - pos.x) ^ 2 + (ent.position.y - pos.y) ^ 2
      if (distance <= 900) then -- 30^2 since seismic range is 30
        return false
      end
    end
  end
  return true
end

function spawnDeathExplosion(entity)
  local radius = deathExplosions[entity.name].radius
  local damage = deathExplosions[entity.name].damage
  local ents =
    entity.surface.find_entities(
    {
      {entity.position.x - radius, entity.position.y - radius},
      {entity.position.x + radius, entity.position.y + radius}
    }
  )
  for _, ent in pairs(ents) do
    if (ent and ent.valid and ent.destructible and ent.health ~= nil and ent.health > 0) then
      ent.damage(damage, entity.force, "explosion")
    end
  end
end

function maybeTunnel(entity)
  if ((game.tick + global[PREFIX .. "shiftTick"]) % 100 == 0 and noSeismic(entity.position)) then -- chance of tunneling on damage
    global[PREFIX .. "shiftTick"] = global[PREFIX .. "shiftTick"] + 1
    local tunnelPos = getTunnelPos(entity)
    local surface = entity.surface
    local goodPos = surface.find_non_colliding_position(entity.name, tunnelPos, 15, 1)
    if (goodPos ~= nil and noSeismic(goodPos)) then -- can't be seismic turrets at the destination either
      global[PREFIX .. "tunnels"][(game.tick - game.tick % 60) + 3 * 60] = {
        -- round to 3 seconds later
        goodPos,
        {
          name = entity.name,
          health = entity.health,
          orientation = entity.orientation,
          surface = entity.surface
        }
      }
      entity.surface.create_entity({name = PREFIX .. "tunnel", position = entity.position})
      entity.destroy()
    end
  end
end

function nameToSize(name)
  if (string.match(name, "small")) then
    return "small"
  elseif (string.match(name, "medium")) then
    return "medium"
  elseif (string.match(name, "big")) then
    return "big"
  elseif (string.match(name, "behemoth")) then
    return "behemoth"
  end
end

function clearLeechDrains(entity)
  for _, struct in pairs(global[PREFIX .. "leech-drains"]) do
    if (struct[1] == entity) then
      struct[2].destroy()
      struct = nil
    end
  end
end

function moveLeechDrain(entity)
  if ((game.tick + global[PREFIX .. "shiftTick2"]) % 20 == 0) then
    global[PREFIX .. "shiftTick2"] = global[PREFIX .. "shiftTick2"] + 1
    local size = nameToSize(entity.name)
    local newDrain =
      entity.surface.create_entity(
      {
        name = PREFIX .. size .. "-leech-drain",
        position = getTunnelPos(entity) --entity.position
      }
    )
    if (newDrain ~= nil) then
      table.insert(
        global[PREFIX .. "leech-drains"],
        {
          entity,
          newDrain
        }
      )
    end
  end
end

function maybeSpawnMimic(tree)
  global[PREFIX .. "-mimic-counter"] = global[PREFIX .. "-mimic-counter"] + 1
  if (global[PREFIX .. "-mimic-counter"] % 60 ~= 0) then
    return
  end
  local evo = game.forces["enemy"].evolution_factor
  local size = nil
  if (evo > 0.9) then
    size = "behemoth"
  elseif (evo > 0.5) then
    size = "big"
  elseif (evo > 0.2) then
    size = "medium"
  else
    size = "small"
  end
  tree.surface.create_entity(
    {
      name = PREFIX .. size .. "-mimic-biter",
      position = tree.position
    }
  )
end

function getTunnelPos(entity)
  local radius = 15 + (game.tick % 15) -- 10 to 25
  local tunnelPos = {
    x = entity.position.x,
    y = entity.position.y
  }
  local rad = 2 * math.pi * entity.orientation
  tunnelPos.x = tunnelPos.x + math.sin(rad) * radius
  tunnelPos.y = tunnelPos.y - math.cos(rad) * radius
  return tunnelPos
end

function onDie(event)
  local entity = event.entity

  if (isExplosiveBiter(entity) and (not settings.global[PREFIX .. "-disable-explosive"])) then
    spawnDeathExplosion(entity)
  elseif (isLeechSpitter(entity)) then
    clearLeechDrains(entity)
  elseif (isSeismic(entity)) then
    global[PREFIX .. "seismic"][entity] = nil
  end
end
script.on_event(defines.events.on_entity_died, onDie)

function onTick(event)
  if (event.tick % 60 * 4 == 0) then
    if (not settings.global[PREFIX .. "-disable-tunnel"]) then
      for _, surface in pairs(game.surfaces) do
        for tick, tunnel in pairs(global[PREFIX .. "tunnels"]) do
          if (tick == game.tick) then
            local pos = tunnel[1]
            local oldEnt = tunnel[2]

            if (oldEnt.surface.valid) then
              local newEnt = oldEnt.surface.create_entity({name = oldEnt.name, position = pos})
              if (newEnt ~= nil) then
                newEnt.surface.create_entity({name = PREFIX .. "tunnel", position = newEnt.position})
                newEnt.health = oldEnt.health
                newEnt.orientation = oldEnt.orientation
                global[PREFIX .. "tunnels"][tick] = nil
              end
            end
          end
        end
      end
    end
  end
end

script.on_event(defines.events.on_tick, onTick)

function onMined(event)
  local entity = event.entity

  if (isSeismic(entity)) then
    global[PREFIX .. "seismic"][entity] = nil
  end

  if (isTree(entity)) then
    maybeSpawnMimic(entity)
  end
end
script.on_event(defines.events.on_player_mined_entity, onMined)


function onDamaged(event)
  local entity = event.entity

  if (not (entity and entity.valid)) then
    return
  end

  if (isLeechSpitter(entity) and (not settings.global[PREFIX .. "-disable-leech"])) then
    moveLeechDrain(entity)
  end

  if (isTunnelerBiter(entity)) then
    maybeTunnel(entity)
  end
end
script.on_event(defines.events.on_entity_damaged, onDamaged)

function onBuilt(event)
  local entity = event.created_entity

  if (not (entity and entity.valid)) then
    return
  end
  if (isSeismic(entity)) then
    global[PREFIX .. "seismic"][entity] = true
  end
end
script.on_event(defines.events.on_built_entity, onBuilt)

function onAmmo(event)
  local player = game.players[event.player_index]

  if (not (player and player.valid)) then
    return
  end

  if player.get_item_count("atomic-bomb") > 0 then
    global[PREFIX .. "atomic-biters-enbaled"] = true
  end
end
script.on_event(defines.events.on_player_ammo_inventory_changed, onAmmo)

script.on_init(
  function()
    game.forces["enemy"].friendly_fire = false
    global[PREFIX .. "tunnels"] = {}
    global[PREFIX .. "seismic"] = {}
    global[PREFIX .. "leech-drains"] = {}
    global[PREFIX .. "atomic-biters-enbaled"] = false
    global[PREFIX .. "-mimic-counter"] = 1
    global[PREFIX .. "shiftTick"] = 0
    global[PREFIX .. "shiftTick2"] = 0
  end
)

script.on_configuration_changed(
  function()
    if (global[PREFIX .. "shiftTick"] == nil) then
      global[PREFIX .. "shiftTick"] = 0
    end
    if (global[PREFIX .. "shiftTick2"] == nil) then
      global[PREFIX .. "shiftTick2"] = 0
    end
    if (global[PREFIX .. "-mimic-counter"] == nil) then
      global[PREFIX .. "-mimic-counter"] = 1
    end
  end
)
