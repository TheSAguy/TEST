PREFIX = "more-biters-"

-- since we can't change prototypes in a multiplayer-friendly way, we just change controls
-- Kovarex pls give us write access to result_units ༼ つ ◕_◕ ༽つ

data:extend {
  {
    name = PREFIX .. "disable-tunnel",
    type = "bool-setting",
    setting_type = "runtime-global",
    default_value = false
  },
  {
    name = PREFIX .. "disable-leech",
    type = "bool-setting",
    setting_type = "runtime-global",
    default_value = false
  },
  {
    name = PREFIX .. "disable-explosive",
    type = "bool-setting",
    setting_type = "runtime-global",
    default_value = false
  }
}
