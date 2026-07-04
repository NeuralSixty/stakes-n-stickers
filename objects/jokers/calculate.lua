local calculate_toxic_exposure_increase = function(card, left_joker, right_joker)
  if card.ability.sns_toxic and not (card.debuff and card.ability.sns_delayed and card.ability.sns_delay_tally ~= 0) then
    -- "saved_from_game_over" handles an extreme edge case where Mr. Bones saves the run from ending but still gets affected by Toxic Jokers
    -- There's a time frame where it gets disabled before the card starts dissolving, which might confuse players
    if left_joker and not left_joker.ability.saved_from_game_over and (not left_joker.debuff or (left_joker.debuff and left_joker.ability.crimson_heart_chosen) or (left_joker.debuff and (left_joker.ability.debuff_sources and not left_joker.ability.debuff_sources['toxic']) and (left_joker.ability.sns_delayed and left_joker.ability.sns_delay_tally ~= 0))) then
      left_joker.ability.extra.toxic_stack = left_joker.ability.extra.toxic_stack + 1

      if left_joker.ability.extra.toxic_stack == 1 then
        left_joker:add_sticker('sns_toxic_stack_one')
        left_joker:remove_sticker('sns_toxic_stack_two')
      end
      if left_joker.ability.extra.toxic_stack == 2 then
        left_joker:add_sticker('sns_toxic_stack_two')
        left_joker:remove_sticker('sns_toxic_stack_one')
      end

      card_eval_status_text(left_joker, 'extra', nil, nil, nil,
        { message = localize('k_toxic_plus_one'), colour = G.C.FILTER, delay = 0.45 })

      if left_joker.ability.extra.toxic_stack >= 3 then
        left_joker.ability.extra.toxic_stack = 0
        left_joker:remove_sticker('sns_toxic_stack_two')
        left_joker:remove_sticker('sns_toxic_stack_one')

        SMODS.debuff_card(left_joker, true, "toxic")

        if (left_joker.ability.eternal) then
          Card.set_edition(left_joker, 'e_negative')
        end

        card_eval_status_text(left_joker, 'extra', nil, nil, nil,
          { message = localize('k_disabled_ex'), colour = G.C.FILTER, delay = 0.45 })
      end
    end

    if right_joker and (not right_joker.debuff or (right_joker.debuff and right_joker.ability.crimson_heart_chosen) or (right_joker.debuff and (right_joker.ability.debuff_sources and not right_joker.ability.debuff_sources['toxic']) and (right_joker.ability.sns_delayed and right_joker.ability.sns_delay_tally ~= 0))) then
      right_joker.ability.extra.toxic_stack = right_joker.ability.extra.toxic_stack + 1

      if right_joker.ability.extra.toxic_stack == 1 then
        right_joker:add_sticker('sns_toxic_stack_one')
        right_joker:remove_sticker('sns_toxic_stack_two')
      end
      if right_joker.ability.extra.toxic_stack == 2 then
        right_joker:add_sticker('sns_toxic_stack_two')
        right_joker:remove_sticker('sns_toxic_stack_one')
      end

      card_eval_status_text(right_joker, 'extra', nil, nil, nil,
        { message = localize('k_toxic_plus_one'), colour = G.C.FILTER, delay = 0.45 })

      if right_joker.ability.extra.toxic_stack >= 3 then
        right_joker.ability.extra.toxic_stack = 0
        right_joker:remove_sticker('sns_toxic_stack_two')
        right_joker:remove_sticker('sns_toxic_stack_one')

        SMODS.debuff_card(right_joker, true, "toxic")

        if (right_joker.ability.eternal) then
          Card.set_edition(right_joker, 'e_negative')
        end

        card_eval_status_text(right_joker, 'extra', nil, nil, nil,
          { message = localize('k_disabled_ex'), colour = G.C.FILTER, delay = 0.45 })
      end
    end
  end
end

local calculate_toxic_exposure_decrease = function(card, left_joker, right_joker)
  if card.ability.extra.toxic_stack > 0 and ((not left_joker or (left_joker and not left_joker.ability.sns_toxic or (left_joker.ability.sns_delayed and left_joker.ability.sns_delay_tally > 0))) and (not right_joker or (right_joker and not right_joker.ability.sns_toxic or (right_joker.ability.sns_delayed and right_joker.ability.sns_delay_tally > 0)))) then
    card.ability.extra.toxic_stack = card.ability.extra.toxic_stack - 1

    if card.ability.extra.toxic_stack == 0 then
      card:remove_sticker('sns_toxic_stack_one')
      card:remove_sticker('sns_toxic_stack_two')
    end
    if card.ability.extra.toxic_stack == 1 then
      card:add_sticker('sns_toxic_stack_one')
      card:remove_sticker('sns_toxic_stack_two')
    end
    if card.ability.extra.toxic_stack == 2 then
      card:add_sticker('sns_toxic_stack_two')
      card:remove_sticker('sns_toxic_stack_one')
    end

    card_eval_status_text(card, 'extra', nil, nil, nil,
      { message = localize('k_toxic_minus_one'), colour = G.C.FILTER, delay = 0.45 })
  end
end

SMODS.current_mod.calculate = function(self, context)
  for k, card in pairs(G.jokers.cards) do
    if context.end_of_round and not context.repetition and not context.individual then
      -- Toxic Sticker logic
      -- Can't be done inside a regular Toxic Sticker calculate function because the card with the Toxic sticker could also be debuffed,
      -- meaning that the Toxic sticker's calculate function wouldn't run, it needs to be done in current_mod.calculate
      local left_joker = G.jokers.cards[k - 1]
      local right_joker = G.jokers.cards[k + 1]

      calculate_toxic_exposure_increase(card, left_joker, right_joker)
      calculate_toxic_exposure_decrease(card, left_joker, right_joker)

      -- Delayed Sticker logic
      -- Can't be done inside a regular Delayed Sticker calculate function because the card with the sticker is debuffed on purchase
      -- Therefore the calculate function won't run, it needs to be done in current_mod.calculate
      if card.ability.sns_delayed and card.ability.sns_delay_tally > 0 and (card.ability.debuff_sources and not card.ability.debuff_sources['toxic']) then
        if card.ability.sns_delay_tally == 1 then
          card.ability.sns_delay_tally = 0
          card.ability.sns_delayed = nil

          if card.ability.extra then
            card.ability.extra.original_factor = card.ability.extra.original_factor * 2
            card.ability.extra.current_factor = card.ability.extra.current_factor * 2
          end

          SMODS.debuff_card(card, false, "delay")
          if not card.debuff then
            card_eval_status_text(card, 'extra', nil, nil, nil,
              { message = localize('k_active_ex'), colour = G.C.FILTER, delay = 0.45 })
          end
        else
          card.ability.sns_delay_tally = card.ability.sns_delay_tally - 1
          card_eval_status_text(card, 'extra', nil, nil, nil,
            {
              message = localize { type = 'variable', key = 'a_active', vars = { card.ability.sns_delay_tally } },
              colour =
                  G.C.FILTER,
              delay = 0.45
            })
        end
      end
    end
  end
end
