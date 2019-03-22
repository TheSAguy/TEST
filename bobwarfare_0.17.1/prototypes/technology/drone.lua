data:extend(
{
  {
    type = "technology",
    name = "bob-robot-tanks",
    icon = "__bobwarfare__/graphics/icons/technology/tanks.png",
    icon_size = 64,
    prerequisites =
    {
      "robotics",
      "tanks",
      "laser-turrets",
      "electric-engine",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-robot-tank"
      },
    },
    unit =
    {
      count = 75,
      ingredients = 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30
    },
    order = "e-c-c-a"
  },
}
)

