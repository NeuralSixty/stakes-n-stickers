SMODS.Stake {
  name = "Ceramic White Stake",
  key = "ceramic_white",
  atlas = "sns_chips_ceramic_atlas",
  unlocked = true,
  applied_stakes = {},
  pos = { x = 0, y = 0 },
  sticker_pos = { x = 1, y = 0 },
  modifiers = function()
    G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 2
  end,
  colour = G.C.WHITE,
}

SMODS.Stake {
  name = "Ceramic Red Stake",
  key = "ceramic_red",
  atlas = "sns_chips_ceramic_atlas",
  applied_stakes = { "ceramic_white" },
  pos = { x = 1, y = 0 },
  sticker_pos = { x = 2, y = 0 },
  modifiers = function()
    G.GAME.modifiers.enable_eternals_in_shop = true
  end,
  colour = G.C.RED,
}

SMODS.Stake {
  name = "Ceramic Green Stake",
  key = "ceramic_green",
  atlas = "sns_chips_ceramic_atlas",
  applied_stakes = { "ceramic_red" },
  pos = { x = 2, y = 0 },
  sticker_pos = { x = 3, y = 0 },
  modifiers = function()
    G.GAME.modifiers.enable_perishables_in_shop = true
  end,
  colour = G.C.GREEN,
}

SMODS.Stake {
  name = "Ceramic Black Stake",
  key = "ceramic_black",
  atlas = "sns_chips_ceramic_atlas",
  applied_stakes = { "ceramic_green" },
  pos = { x = 4, y = 0 },
  sticker_pos = { x = 0, y = 1 },
  modifiers = function()
    G.GAME.modifiers.enable_rentals_in_shop = true
  end,
  colour = G.C.BLACK,
}

SMODS.Stake {
  name = "Ceramic Blue Stake",
  key = "ceramic_blue",
  atlas = "sns_chips_ceramic_atlas",
  applied_stakes = { "ceramic_black" },
  pos = { x = 3, y = 0 },
  sticker_pos = { x = 4, y = 0 },
  modifiers = function()
    G.GAME.modifiers.enable_sns_magnet = true
  end,
  colour = G.C.BLUE,
}

SMODS.Stake {
  name = "Ceramic Purple Stake",
  key = "ceramic_purple",
  atlas = "sns_chips_ceramic_atlas",
  applied_stakes = { "ceramic_blue" },
  pos = { x = 0, y = 1 },
  sticker_pos = { x = 1, y = 1 },
  modifiers = function()
    G.GAME.modifiers.enable_sns_delayed = true
  end,
  colour = G.C.PURPLE,
}

SMODS.Stake {
  name = "Ceramic Orange Stake",
  key = "ceramic_orange",
  atlas = "sns_chips_ceramic_atlas",
  applied_stakes = { "ceramic_purple" },
  pos = { x = 1, y = 1 },
  sticker_pos = { x = 2, y = 1 },
  modifiers = function()
    G.GAME.modifiers.enable_sns_toxic = true
  end,
  colour = G.C.ORANGE,
}

SMODS.Stake {
  name = "Ceramic Gold Stake",
  key = "ceramic_gold",
  atlas = "sns_chips_ceramic_atlas",
  applied_stakes = { "ceramic_orange" },
  pos = { x = 2, y = 1 },
  sticker_pos = { x = 3, y = 1 },
  modifiers = function()
    G.GAME.modifiers.enable_sns_supercritical = true
  end,
  colour = G.C.GOLD,
  shiny = true
}
