data:extend(
{
  {
    type = "technology",
    name = "bob-turrets-2",
    icon = "__base__/graphics/technology/turrets.png",
    icon_size = 128,
    upgrade = "true",
    order = "a-j-a-2",
    prerequisites =
    {
      "turrets",
      "steel-processing",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-gun-turret-2"
      }
    },
    unit =
    {
      count = 30,
      time = 15,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
    },
  },

  {
    type = "technology",
    name = "bob-turrets-3",
    icon = "__base__/graphics/technology/turrets.png",
    icon_size = 128,
    upgrade = "true",
    order = "a-j-a-3",
    prerequisites =
    {
      "bob-turrets-2",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-gun-turret-3"
      }
    },
    unit =
    {
      count = 50,
      time = 15,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
      },
    },
  },

  {
    type = "technology",
    name = "bob-turrets-4",
    icon = "__base__/graphics/technology/turrets.png",
    icon_size = 128,
    upgrade = "true",
    order = "a-j-a-4",
    prerequisites =
    {
      "bob-turrets-3",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-gun-turret-4"
      }
    },
    unit =
    {
      count = 75,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
    },
  },

  {
    type = "technology",
    name = "bob-turrets-5",
    icon = "__base__/graphics/technology/turrets.png",
    icon_size = 128,
    upgrade = "true",
    order = "a-j-a-5",
    prerequisites =
    {
      "bob-turrets-4",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-gun-turret-5"
      }
    },
    unit =
    {
      count = 100,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
    },
  },


  {
    type = "technology",
    name = "bob-laser-turrets-2",
    icon = "__base__/graphics/technology/laser-turrets.png",
    icon_size = 128,
    order = "a-j-b-2",
    upgrade = "true",
    prerequisites =
    {
      "laser-turrets",
      "advanced-electronics",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-laser-turret-2"
      }
    },
    unit =
    {
      count = 75,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
      },
    },
  },

  {
    type = "technology",
    name = "bob-laser-turrets-3",
    icon = "__base__/graphics/technology/laser-turrets.png",
    icon_size = 128,
    order = "a-j-b-3",
    upgrade = "true",
    prerequisites =
    {
      "bob-laser-turrets-2",
    },
    unit =
    {
      count = 75,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-laser-turret-3"
      }
    },
  },

  {
    type = "technology",
    name = "bob-laser-turrets-4",
    icon = "__base__/graphics/technology/laser-turrets.png",
    icon_size = 128,
    order = "a-j-b-4",
    upgrade = "true",
    prerequisites =
    {
      "bob-laser-turrets-3",
      "advanced-electronics-2"
    },
    unit =
    {
      count = 100,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-laser-turret-4"
      }
    },
  },

  {
    type = "technology",
    name = "bob-laser-turrets-5",
    icon = "__base__/graphics/technology/laser-turrets.png",
    icon_size = 128,
    order = "a-j-b-5",
    upgrade = "true",
    prerequisites =
    {
      "bob-laser-turrets-4",
    },
    unit =
    {
      count = 100,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-laser-turret-5"
      }
    },
  },

  {
    type = "technology",
    name = "bob-sniper-turrets-1",
    icon = "__base__/graphics/technology/turrets.png",
    icon_size = 128,
    order = "a-j-c-1",
    upgrade = "true",
    prerequisites =
    {
      "turrets",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-sniper-turret-1"
      }
    },
    unit =
    {
      count = 25,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
      },
    },
  },
  {
    type = "technology",
    name = "bob-sniper-turrets-2",
    icon = "__base__/graphics/technology/turrets.png",
    icon_size = 128,
    order = "a-j-c-2",
    upgrade = "true",
    prerequisites =
    {
      "bob-sniper-turrets-1",
      "steel-processing",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-sniper-turret-2"
      }
    },
    unit =
    {
      count = 75,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
    },
  },
  {
    type = "technology",
    name = "bob-sniper-turrets-3",
    icon = "__base__/graphics/technology/turrets.png",
    icon_size = 128,
    order = "a-j-c-3",
    upgrade = "true",
    prerequisites =
    {
      "bob-sniper-turrets-2",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-sniper-turret-3"
      }
    },
    unit =
    {
      count = 125,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
    },
  },
}
)


data:extend(
{
  {
    type = "technology",
    name = "bob-artillery-turret-2",
    icon_size = 128,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-artillery-turret-2"
      },
    },
    prerequisites =
    {
      "artillery"
    },
    unit =
    {
      time = 30,
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
      },
    },
    order = "d-e-f-2"
  },

  {
    type = "technology",
    name = "bob-artillery-turret-3",
    icon_size = 128,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bob-artillery-turret-3"
      },
    },
    prerequisites =
    {
      "bob-artillery-turret-2"
    },
    unit =
    {
      time = 30,
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
      },
    },
    order = "d-e-f-3"
  },
}
)


