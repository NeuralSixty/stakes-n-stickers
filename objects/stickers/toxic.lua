SMODS.Sticker {
  key = 'toxic',
  atlas = 'sns_stickers_atlas',
  badge_colour = HEX('35da2d'),
  pos = { x = 4, y = 2 },
  default_compat = true,
  needs_enabled_flag = true,
  sets = {
    Joker = true
  },
  rate = 0.3,
  should_apply = function(self, card, center, area, bypass_roll)
    local toxic_roll = pseudorandom("sns_toxic")
    return G.GAME.modifiers.enable_sns_toxic and card.config.center.sns_toxic_compat and
        ((toxic_roll > 0.4) and (toxic_roll <= 0.7)) and (area == G.shop_jokers or area == G.pack_cards)
  end
}

SMODS.Sticker {
  key = 'toxic_stack_one',
  atlas = 'sns_stickers_atlas',
  badge_colour = HEX('35da2d'),
  pos = { x = 0, y = 3 },
  default_compat = true,
  needs_enabled_flag = false,
  rate = 0,
  sets = {
    Joker = true
  },
  should_apply = function(self, card, center, area, bypass_roll)
    return card.ability and card.ability.set == "Joker" and card.ability.extra and card.ability.extra.toxic_stack == 1
  end
}

SMODS.Sticker {
  key = 'toxic_stack_two',
  atlas = 'sns_stickers_atlas',
  badge_colour = HEX('35da2d'),
  pos = { x = 1, y = 3 },
  default_compat = true,
  needs_enabled_flag = false,
  rate = 0,
  sets = {
    Joker = true
  },
  should_apply = function(self, card, center, area, bypass_roll)
    return card.ability and card.ability.set == "Joker" and card.ability.extra and card.ability.extra.toxic_stack == 2
  end
}
