local calculate_toxic_exposure_increase = function(card, left_joker, right_joker)
  if card.ability.sns_toxic and not (card.debuff and card.ability.sns_delayed and card.ability.sns_delay_tally ~= 0) and not card.destroyed then
    -- "saved_from_game_over" handles an extreme edge case where Mr. Bones saves the run from ending but still gets affected by Toxic Jokers
    -- There's a time frame where it gets disabled before the card starts dissolving, which might confuse players
    if left_joker and not left_joker.ability.saved_from_game_over and not left_joker.destroyed and not (left_joker.ability.debuff_sources and (left_joker.ability.debuff_sources['toxic'] or left_joker.ability.debuff_sources['perishable'])) and (not left_joker.debuff or (left_joker.debuff and left_joker.ability.crimson_heart_chosen) or (left_joker.debuff and (left_joker.ability.debuff_sources and not left_joker.ability.debuff_sources['toxic']) and (left_joker.ability.sns_delayed and left_joker.ability.sns_delay_tally ~= 0))) then
      left_joker.ability.extra.toxic_stack = left_joker.ability.extra.toxic_stack + 1

      if left_joker.ability.extra.toxic_stack == 1 then
        card_eval_status_text(left_joker, 'extra', nil, nil, nil,
          {
            message = localize('k_toxic_plus_one'),
            colour = G.C.FILTER,
            delay = 0.45,
            extrafunc = function()
              left_joker:add_sticker('sns_toxic_stack_one')
              left_joker:remove_sticker('sns_toxic_stack_two')
            end
          }
        )
      end

      if left_joker.ability.extra.toxic_stack == 2 then
        card_eval_status_text(left_joker, 'extra', nil, nil, nil,
          {
            message = localize('k_toxic_plus_one'),
            colour = G.C.FILTER,
            delay = 0.45,
            extrafunc = function()
              left_joker:add_sticker('sns_toxic_stack_two')
              left_joker:remove_sticker('sns_toxic_stack_one')
            end
          }
        )
      end

      if left_joker.ability.extra.toxic_stack >= 3 then
        left_joker.ability.debuff_sources['toxic'] = true

        card_eval_status_text(left_joker, 'extra', nil, nil, nil,
          {
            message = localize('k_disabled_ex'),
            colour = G.C.FILTER,
            delay = 0.45,
            extrafunc = function()
              left_joker.ability.extra.toxic_stack = 0
              left_joker:remove_sticker('sns_toxic_stack_two')
              left_joker:remove_sticker('sns_toxic_stack_one')

              SMODS.debuff_card(left_joker, true, "toxic")

              if (left_joker.ability.eternal) then
                Card.set_edition(left_joker, 'e_negative', true)
              end
            end
          }
        )
      end
    end

    if right_joker and not right_joker.destroyed and not (right_joker.ability.debuff_sources and (right_joker.ability.debuff_sources['toxic'] or right_joker.ability.debuff_sources['perishable'])) and (not right_joker.debuff or (right_joker.debuff and right_joker.ability.crimson_heart_chosen) or (right_joker.debuff and (right_joker.ability.debuff_sources and not right_joker.ability.debuff_sources['toxic']) and (right_joker.ability.sns_delayed and right_joker.ability.sns_delay_tally ~= 0))) then
      right_joker.ability.extra.toxic_stack = right_joker.ability.extra.toxic_stack + 1

      if right_joker.ability.extra.toxic_stack == 1 then
        card_eval_status_text(right_joker, 'extra', nil, nil, nil,
          {
            message = localize('k_toxic_plus_one'),
            colour = G.C.FILTER,
            delay = 0.45,
            extrafunc = function()
              right_joker:add_sticker('sns_toxic_stack_one')
              right_joker:remove_sticker('sns_toxic_stack_two')
            end
          }
        )
      end

      if right_joker.ability.extra.toxic_stack == 2 then
        card_eval_status_text(right_joker, 'extra', nil, nil, nil,
          {
            message = localize('k_toxic_plus_one'),
            colour = G.C.FILTER,
            delay = 0.45,
            extrafunc = function()
              right_joker:add_sticker('sns_toxic_stack_two')
              right_joker:remove_sticker('sns_toxic_stack_one')
            end
          }
        )
      end

      if right_joker.ability.extra.toxic_stack >= 3 then
        right_joker.ability.debuff_sources['toxic'] = true

        card_eval_status_text(right_joker, 'extra', nil, nil, nil,
          {
            message = localize('k_disabled_ex'),
            colour = G.C.FILTER,
            delay = 0.45,
            extrafunc = function()
              right_joker.ability.extra.toxic_stack = 0
              right_joker:remove_sticker('sns_toxic_stack_two')
              right_joker:remove_sticker('sns_toxic_stack_one')

              SMODS.debuff_card(right_joker, true, "toxic")

              if (right_joker.ability.eternal) then
                Card.set_edition(right_joker, 'e_negative', true)
              end
            end
          }
        )
      end
    end
  end
end

local calculate_toxic_exposure_decrease = function(card, left_joker, right_joker)
  if card.ability.extra.toxic_stack > 0 and ((card.debuff and card.ability.perishable and card.ability.perish_tally == 0) or ((not left_joker or (left_joker and not left_joker.ability.sns_toxic or (left_joker.ability.sns_delayed and left_joker.ability.sns_delay_tally > 0))) and (not right_joker or (right_joker and not right_joker.ability.sns_toxic or (right_joker.ability.sns_delayed and right_joker.ability.sns_delay_tally > 0))))) then
    card.ability.extra.toxic_stack = card.ability.extra.toxic_stack - 1

    if card.ability.extra.toxic_stack == 0 then
      card_eval_status_text(card, 'extra', nil, nil, nil,
        {
          message = localize('k_toxic_minus_one'),
          colour = G.C.FILTER,
          delay = 0.45,
          extrafunc = function()
            card:remove_sticker('sns_toxic_stack_one')
            card:remove_sticker('sns_toxic_stack_two')
          end
        }
      )
    end

    if card.ability.extra.toxic_stack == 1 then
      card_eval_status_text(card, 'extra', nil, nil, nil,
        {
          message = localize('k_toxic_minus_one'),
          colour = G.C.FILTER,
          delay = 0.45,
          extrafunc = function()
            card:add_sticker('sns_toxic_stack_one')
            card:remove_sticker('sns_toxic_stack_two')
          end
        }
      )
    end

    if card.ability.extra.toxic_stack == 2 then
      card_eval_status_text(card, 'extra', nil, nil, nil,
        {
          message = localize('k_toxic_minus_one'),
          colour = G.C.FILTER,
          delay = 0.45,
          extrafunc = function()
            card:add_sticker('sns_toxic_stack_two')
            card:remove_sticker('sns_toxic_stack_one')
          end
        }
      )
    end
  end
end

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
  end,
  pre_calculate = function(self, card, context)
    if (context.supercritical_calculated and context.supercritical_card == card) or (context.supercritical_skipped and context.supercritical_skipped_card == card) then
      if card.ability and card.ability.set == "Joker" then
        if not card.ability['sns_toxic'] or (card.ability.sns_toxic and card.debuff and card.ability.sns_delayed and card.ability.sns_delay_tally ~= 0) then
          SMODS.calculate_context({ toxic_skipped = true, toxic_skipped_card = card })
        end
      end
    end
  end,
  calculate = function(self, card, context)
    if (context.supercritical_calculated and context.supercritical_card == card) or (context.supercritical_skipped and context.supercritical_skipped_card == card) then
      local jokers = card.area.cards
      local cardIndex = card.rank
      local left_joker = jokers[cardIndex - 1]
      local right_joker = jokers[cardIndex + 1]

      calculate_toxic_exposure_increase(card, left_joker, right_joker)

      return {
        func = function()
          SMODS.calculate_context({ toxic_calculated = true, toxic_card = card })
          return true
        end
      }
    end
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
  end,
  calculate = function (self, card, context)
    if (context.toxic_calculated and context.toxic_card == card) or (context.toxic_skipped and context.toxic_skipped_card == card) then
      local jokers = card.area.cards
      local cardIndex = card.rank
      local left_joker = jokers[cardIndex - 1]
      local right_joker = jokers[cardIndex + 1]

      calculate_toxic_exposure_decrease(card, left_joker, right_joker)
    end
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
  end,
  calculate = function (self, card, context)
    if (context.toxic_calculated and context.toxic_card == card) or (context.toxic_skipped and context.toxic_skipped_card == card) then
      local jokers = card.area.cards
      local cardIndex = card.rank
      local left_joker = jokers[cardIndex - 1]
      local right_joker = jokers[cardIndex + 1]

      calculate_toxic_exposure_decrease(card, left_joker, right_joker)
    end
  end
}
