local clear_magnets = function()
  if not G.jokers then
    return
  end

  for i = 1, #G.jokers.cards do
    G.jokers.cards[i].ability.sns_magnet_attached = false
  end
end

local reattach_magnets = function()
  if not G.jokers then
    return
  end

  for i = 1, #G.jokers.cards do
    if G.jokers.cards[i].ability.sns_magnet then
      local left_joker = G.jokers.cards[i - 1]
      local right_joker = G.jokers.cards[i + 1]

      if left_joker then
        left_joker.ability.sns_magnet_attached = true
      end

      if right_joker then
        right_joker.ability.sns_magnet_attached = true
      end
    end
  end
end

local reset_magnets = function()
  clear_magnets()
  reattach_magnets()
end

SMODS.Sticker {
  key = 'magnet',
  atlas = 'sns_stickers_atlas',
  badge_colour = HEX('bfc7d5'),
  pos = { x = 2, y = 2 },
  default_compat = true,
  needs_enabled_flag = true,
  sets = {
    Joker = true
  },
  rate = 0.3,
  should_apply = function(self, card, center, area, bypass_roll)
    local magnet_roll = pseudorandom("sns_magnet")
    return G.GAME.modifiers.enable_sns_magnet and card.config.center.sns_magnet_compat and
        ((magnet_roll > 0.4) and (magnet_roll <= 0.7)) and (area == G.shop_jokers or area == G.pack_cards)
  end,
  calculate = function(self, card, context)
    if context.card and context.card.added_to_deck and context.card.ability and context.card.ability.set == "Joker" then
      reset_magnets()
    end
  end
}

local moveable_stop_drag_ref = Moveable.stop_drag

function Moveable:stop_drag(dragged)
  reset_magnets()

  local ret = moveable_stop_drag_ref(self, dragged)
  return ret
end

local moveable_drag_ref = Moveable.drag

function Moveable:drag(offset)
  if self.ability and self.ability.set == 'Joker' and self.ability.sns_magnet_attached then
    return false
  end

  local ret = moveable_drag_ref(self, offset)
  return ret
end

local card_remove_ref = Card.remove

function Card:remove()
  local ret = card_remove_ref(self)

  if self.ability and self.ability.set == 'Joker' then
    reset_magnets()
  end

  return ret
end
