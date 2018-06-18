local tunnel = table.deepcopy(data.raw.corpse["small-scorchmark"])

tunnel.name = PREFIX .. "tunnel"
tunnel.type = "corpse" 
tunnel.collision_mask = {}
local sheet = {
  direction_count = 1,
  filename = "__MoreBiters__/graphics/terrain/tunnel.png",
  frame_count = 1,
  height = 400,
  width = 400,
  variation_count = 1,
  x = 0,
  scale = 0.4
}
tunnel.map_color = {
  
}
tunnel.ground_patch.sheet = sheet
tunnel.ground_patch_higher.sheet = sheet
tunnel.time_before_removed = 60*30

data:extend {tunnel}
