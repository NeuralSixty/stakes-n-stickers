SMODS.Stake {
  name = "Clay White Stake",
  key = "clay_white",
  unlocked = true,
  applied_stakes = {},
  pos = { x = 0, y = 0 },
  sticker_pos = { x = 1, y = 0 },
  modifiers = function()
    G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
  end,
  colour = G.C.WHITE,
}

SMODS.Stake {
  name = "Clay Red Stake",
  key = "clay_red",
  applied_stakes = { "clay_white" },
  pos = { x = 1, y = 0 },
  sticker_pos = { x = 2, y = 0 },
  modifiers = function()
    G.GAME.modifiers.enable_eternals_in_shop = true
  end,
  colour = G.C.RED,
}

SMODS.Stake {
  name = "Clay Green Stake",
  key = "clay_green",
  applied_stakes = { "clay_red" },
  pos = { x = 2, y = 0 },
  sticker_pos = { x = 3, y = 0 },
  modifiers = function()
    G.GAME.modifiers.enable_perishables_in_shop = true
  end,
  colour = G.C.GREEN,
}

SMODS.Stake {
  name = "Clay Black Stake",
  key = "clay_black",
  applied_stakes = { "clay_green" },
  pos = { x = 4, y = 0 },
  sticker_pos = { x = 0, y = 1 },
  modifiers = function()
    G.GAME.modifiers.enable_rentals_in_shop = true
  end,
  colour = G.C.BLACK,
}

SMODS.Stake {
  name = "Clay Blue Stake",
  key = "clay_blue",
  applied_stakes = { "clay_black" },
  pos = { x = 3, y = 0 },
  sticker_pos = { x = 4, y = 0 },
  modifiers = function()
    G.GAME.modifiers.enable_sns_magnet = true
  end,
  colour = G.C.BLUE,
}

SMODS.Stake {
  name = "Clay Purple Stake",
  key = "clay_purple",
  applied_stakes = { "clay_blue" },
  pos = { x = 0, y = 1 },
  sticker_pos = { x = 1, y = 1 },
  modifiers = function()
    G.GAME.modifiers.enable_sns_delayed = true
  end,
  colour = G.C.PURPLE,
}

SMODS.Stake {
  name = "Clay Orange Stake",
  key = "clay_orange",
  applied_stakes = { "clay_purple" },
  pos = { x = 1, y = 1 },
  sticker_pos = { x = 2, y = 1 },
  modifiers = function()
    G.GAME.modifiers.enable_sns_toxic = true
  end,
  colour = G.C.ORANGE,
}

SMODS.Stake {
  name = "Clay Gold Stake",
  key = "clay_gold",
  applied_stakes = { "clay_orange" },
  pos = { x = 2, y = 1 },
  sticker_pos = { x = 3, y = 1 },
  modifiers = function()
    G.GAME.modifiers.enable_sns_supercritical = true
  end,
  colour = G.C.GOLD,
  shiny = false,
}
