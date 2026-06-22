SMODS.Stake:take_ownership('white', {
  name = "Plastic White Stake",
})

SMODS.Stake:take_ownership('red', {
  name = "Plastic Red Stake",
  modifiers = function()
    G.GAME.modifiers.enable_eternals_in_shop = true
  end,
})

SMODS.Stake:take_ownership('green', {
  name = "Plastic Green Stake",
  modifiers = function()
    G.GAME.modifiers.enable_perishables_in_shop = true
  end,
})

SMODS.Stake:take_ownership('black', {
  name = "Plastic Black Stake",
  modifiers = function()
    G.GAME.modifiers.enable_rentals_in_shop = true
  end,
})

SMODS.Stake:take_ownership('blue', {
  name = "Plastic Blue Stake",
  modifiers = function()
    G.GAME.modifiers.enable_sns_magnet = true
  end,
})

SMODS.Stake:take_ownership('purple', {
  name = "Plastic Purple Stake",
  modifiers = function()
    G.GAME.modifiers.enable_sns_delayed = true
  end,
})

SMODS.Stake:take_ownership('orange', {
  name = "Plastic Orange Stake",
  modifiers = function()
    G.GAME.modifiers.enable_sns_toxic = true
  end,
})

SMODS.Stake:take_ownership('gold', {
  name = "Plastic Gold Stake",
  modifiers = function()
    G.GAME.modifiers.enable_sns_supercritical = true
  end,
  shiny = false,
})
