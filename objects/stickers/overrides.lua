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
  pre_calculate = function(self, card, context)
    if (context.rental_calculated and context.rental_card == card) or (context.rental_skipped and context.rental_skipped_card == card) then
      if card.ability and card.ability.set == "Joker" then
        if not card.ability['perishable'] or (card.ability.perishable and (card.ability.debuff_sources and (card.ability.debuff_sources['toxic'] or card.ability.debuff_sources['perishable'])) or (card.debuff and card.ability.sns_delayed and card.ability.sns_delay_tally ~= 0)) then
          SMODS.calculate_context({ perishable_skipped = true, perishable_skipped_card = card })
        end
      end
    end
  end,
  calculate = function(self, card, context)
    if not card.destroyed and not (card.ability.debuff_sources and (card.ability.debuff_sources['toxic'] or card.ability.debuff_sources['perishable'])) and ((context.rental_calculated and context.rental_card == card) or (context.rental_skipped and context.rental_skipped_card == card)) then
      card:sns_calculate_perishable()

      return {
        func = function()
          SMODS.calculate_context({ perishable_calculated = true, perishable_card = card })
          return true
        end
      }
    end
  end
})

-- The sticker calculate priority has been defined as follows:
--
-- 1st: Rental
-- 2nd: Perishable
-- 3rd: Supercritical
-- 4th: Toxic
-- 5th: Delayed
--
-- This is, therefore, the starting point for sticker effects.
-- It also waits for Gros Michel, Cavendish and Gift Card end of round effects so as to preserve their vanilla integrity. More about this on the README.
SMODS.Sticker:take_ownership('rental', {
  atlas = 'sns_stickers_atlas',
  should_apply = function(self, card, center, area, bypass_roll)
    local rental_roll = pseudorandom("sns_rental")
    return G.GAME.modifiers.enable_rentals_in_shop and card.config.center.sns_rental_compat and
        ((rental_roll > 0.4) and (rental_roll <= 0.7)) and (area == G.shop_jokers or area == G.pack_cards)
  end,
  pre_calculate = function(self, card, context)
    if
      (
        (context.gift_card_gifted and context.gift_card == card and card.config.center_key == 'j_gift')
        or (context.gros_michel_safe and context.gros_michel_card == card and card.config.center_key == 'j_gros_michel')
        or (context.cavendish_safe and context.cavendish_card == card and card.config.center_key == 'j_cavendish')
        or (
          card.config.center_key ~= 'j_gift' and card.config.center_key ~= 'j_gros_michel' and card.config.center_key ~= 'j_cavendish'
          and (context.end_of_round and not context.repetition and not context.individual)
        )
        or (
          (card.config.center_key == 'j_gift' or card.config.center_key == 'j_gros_michel' or card.config.center_key == 'j_cavendish')
          and (card.debuff and card.ability.sns_delayed and card.ability.sns_delay_tally ~= 0)
          and (context.end_of_round and not context.repetition and not context.individual)
        )
      )
    then
      if card.ability and card.ability.set == "Joker" then
        if not card.ability['rental'] or (card.ability.rental and card.debuff and card.ability.sns_delayed and card.ability.sns_delay_tally ~= 0) then
          SMODS.calculate_context({ rental_skipped = true, rental_skipped_card = card })
        end
      end
    end
  end,
  calculate = function(self, card, context)
    if
      (
        (context.gift_card_gifted and context.gift_card == card and card.config.center_key == 'j_gift')
        or (context.gros_michel_safe and context.gros_michel_card == card and card.config.center_key == 'j_gros_michel')
        or (context.cavendish_safe and context.cavendish_card == card and card.config.center_key == 'j_cavendish')
        or (
          card.config.center_key ~= 'j_gift' and card.config.center_key ~= 'j_gros_michel' and card.config.center_key ~= 'j_cavendish'
          and (context.end_of_round and not context.repetition and not context.individual)
        )
      )
      and not (card.debuff and card.ability.sns_delayed and card.ability.sns_delay_tally ~= 0)
      and not card.destroyed
    then
      card:calculate_rental()

      return {
        func = function()
          SMODS.calculate_context({ rental_calculated = true, rental_card = card })
          return true
        end
      }
    end
  end
})

function Card:sns_calculate_perishable()
  if self.ability.perishable and self.ability.perish_tally > 0 then
    if self.ability.perish_tally == 1 then
      self.ability.perish_tally = 0
      self.ability.debuff_sources['perishable'] = true
      
      card_eval_status_text(self, 'extra', nil, nil, nil,
        {
          message = localize('k_disabled_ex'),
          colour = G.C.FILTER,
          delay = 0.45,
          extrafunc = function()
            SMODS.debuff_card(self, true, "perishable")

            if self.ability.eternal then
              self:set_edition("e_negative", true)
            end
          end
        }
      )
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
