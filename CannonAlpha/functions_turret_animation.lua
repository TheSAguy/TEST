mod_name = "__CannonAlpha__"
entity_name = "cannon-alpha"
width = 256
height = 256


function base_picture(tint)
return
{
	layers =
	{
	  {
		 filename = mod_name .. '/graphics/entity/'..entity_name..'/base.png',
		 priority = "high",
		 width = width,
		 height = height,
		 axially_symmetrical = false,
		 direction_count = 1,
		 frame_count = 1,
		 tint = tint
	  }
	}
 }
end


function preparing_animation(tint)
	return {layers = {
		{
		priority = "medium",
		width = width,
		height = height,
		direction_count = 4,
		frame_count = 16,
		line_length = 8,
		run_mode = "forward",
		axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/folding.png'
		},
      
		{
		flags = { "mask" },
		width = width,
		height = height,
		direction_count = 4,
		frame_count = 16,
		line_length = 8,
		run_mode = "forward",
		--axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/folding_mask.png',
		--tint = tint
		apply_runtime_tint = true
		}
	}}
end

function prepared_animation(tint)
	return {layers = {
		{
		priority = "medium",
		width = width,
		height = height,
		direction_count = 64,
		frame_count = 1, -- always 1
		line_length = 8,
		axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/main.png'
		},
		{
		flags = { "mask" },
		width = width,
		height = height,
		direction_count = 64,
		frame_count = 1, -- always 1
		line_length = 8,
		axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/main_mask.png',
		--tint = tint
		apply_runtime_tint = true
		}
	}}
end

function attacking_animation(tint)
	return {layers = {
		{
		priority = "medium",
		width = width,
		height = height,
		direction_count = 64, -- main [1],
		frame_count = 1, -- -- can be 2 or 3, when you have attacking animation; 1 for no animated
		line_length = 8, -- main [3],
		run_mode = "forward",
		axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/main.png'
		},
		{
		flags = { "mask" },
		width = width,
		height = height,
		direction_count = 64,
		frame_count = 1, -- can be 2 or 3, when you have attacking animation; 1 for no animated
		line_length = 8,
		run_mode = "forward",
		axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/main_mask.png',
		--tint = tint
		apply_runtime_tint = true
		}
	}}
end

function folding_animation(tint)
	return {layers = {
		{
		priority = "medium",
		width = width,
		height = height,
		direction_count = 4, -- folding[1],
		frame_count = 16, -- folding[2],
		line_length = 8, -- folding[3],
		run_mode = "backward",
		axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/folding.png'
		},
		{
		flags = { "mask" },
		width = width,
		height = height,
		direction_count = 4,
		frame_count = 16,
		line_length = 8,
		run_mode = "backward",
		axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/folding_mask.png',
		--tint = tint
		apply_runtime_tint = true
		}
	}}
end

function folded_animation(tint)
	return {layers = {
		{
		priority = "medium",
		width = width,
		height = height,
		direction_count = 4,
		frame_count = 2, -- idk why, for skipping second sprite
		line_length = 1,
		run_mode = "forward",
		axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/folding.png'
		},
		{
		flags = { "mask" },
		width = width,
		height = height,
		direction_count = 4,
		frame_count = 2, -- idk why, for skipping second sprite
		line_length = 1,
		run_mode = "forward",
		axially_symmetrical = false,
		filename = mod_name .. '/graphics/entity/'..entity_name..'/folding.png',
		--tint = tint
		apply_runtime_tint = true
		}
	}}
end