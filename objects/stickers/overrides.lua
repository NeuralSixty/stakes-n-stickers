SMODS.Sticker:take_ownership('eternal', {
  atlas = 'sns_stickers_atlas',
  should_apply = function(self, card, center, area, bypass_roll)
    local eternal_roll = pseudorandom("sns_eternal")
    return G.GAME.modifiers.enable_eternals_in_shop and card.config.center.eternal_compat and
        ((eternal_roll > 0.4) and (eternal_roll <= 0.7)) and (area == G.shop_jokers or area == G.pack_cards)
  end,
})

SMODS.Sticker:take_ownership('perishable', {
  atlas = 'sns_stickers_atlas',
  should_apply = function(self, card, center, area, bypass_roll)
    local perishable_roll = pseudorandom("sns_perishable")
    return G.GAME.modifiers.enable_perishables_in_shop and card.config.center.perishable_compat and
        ((perishable_roll > 0.4) and (perishable_roll <= 0.7)) and (area == G.shop_jokers or area == G.pack_cards)
  end,
  apply = function(self, card, val)
    card.ability[self.key] = val

    if card.ability[self.key] then
      card.ability.perish_tally = G.GAME.perishable_rounds
    end
  end,
  calculate = function(self, card, context)
    if context.end_of_round and not context.repetition and not context.individual then
      card:sns_calculate_perishable()
    end
  end
})

SMODS.Sticker:take_ownership('rental', {
  atlas = 'sns_stickers_atlas',
  should_apply = function(self, card, center, area, bypass_roll)
    local rental_roll = pseudorandom("sns_rental")
    return G.GAME.modifiers.enable_rentals_in_shop and card.config.center.sns_rental_compat and
        ((rental_roll > 0.4) and (rental_roll <= 0.7)) and (area == G.shop_jokers or area == G.pack_cards)
  end,
  calculate = function(self, card, context)
    if context.end_of_round and not context.repetition and not context.individual and not (card.debuff and card.ability.sns_delayed and card.ability.sns_delay_tally ~= 0) then
      card:calculate_rental()
    end
  end
})

function Card:sns_calculate_perishable()
  if self.ability.perishable and self.ability.perish_tally > 0 then
    if self.ability.perish_tally == 1 then
      self.ability.perish_tally = 0
      card_eval_status_text(self, 'extra', nil, nil, nil,
        { message = localize('k_disabled_ex'), colour = G.C.FILTER, delay = 0.45 })
      self:set_debuff()

      if self.ability.eternal then
        self:set_edition("e_negative")
      end
    else
      self.ability.perish_tally = self.ability.perish_tally - 1
      card_eval_status_text(self, 'extra', nil, nil, nil,
        {
          message = localize { type = 'variable', key = 'a_remaining', vars = { self.ability.perish_tally } },
          colour = G
              .C.FILTER,
          delay = 0.45
        })
    end
  end
end
