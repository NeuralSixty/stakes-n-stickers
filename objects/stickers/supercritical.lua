SMODS.Sticker {
  key = 'supercritical',
  atlas = 'sns_stickers_atlas',
  badge_colour = HEX('7f75c6'),
  pos = { x = 4, y = 1 },
  default_compat = true,
  needs_enabled_flag = true,
  sets = {
    Joker = true
  },
  rate = 0.3,
  should_apply = function(self, card, center, area, bypass_roll)
    local supercritical_roll = pseudorandom("sns_supercritical")
    return G.GAME.modifiers.enable_sns_supercritical and card.config.center.sns_supercritical_compat and
        ((supercritical_roll > 0.4) and (supercritical_roll <= 0.7)) and (area == G.shop_jokers or area == G.pack_cards)
  end,
  pre_calculate = function(self, card, context)
    if (context.perishable_calculated and context.perishable_card == card) or (context.perishable_skipped and context.perishable_skipped_card == card) then
      if card.ability and card.ability.set == "Joker" then
        if not card.ability['sns_supercritical'] or (card.ability.sns_supercritical and card.debuff and card.ability.sns_delayed and card.ability.sns_delay_tally ~= 0) then
          SMODS.calculate_context({ supercritical_skipped = true, supercritical_skipped_card = card })
        end
      end
    end
  end,
  calculate = function(self, card, context)
    if (context.perishable_calculated and context.perishable_card == card) or (context.perishable_skipped and context.perishable_skipped_card == card) then
      local last_factor = card.ability.extra.current_factor;

      card.ability.extra.supercritical_stage = card.ability.extra.supercritical_stage + 1

      if card.ability.extra.supercritical_stage >= 5 then
        local jokers = card.area.cards
        local cardIndex = card.rank
        local left_joker = jokers[cardIndex - 1]
        local right_joker = jokers[cardIndex + 1]

        card.ability.extra.current_factor = card.ability.extra.original_factor
        card.ability.extra.delta_factor = card.ability.extra.current_factor - last_factor

        if not card.ability.eternal then
          -- Why do we need this, you ask? It looks like if we want to time the card destroy animation
          -- with the card_eval_status_text, then it's gotta be part of the delay.
          -- But then the card won't be destroyed until the delay hits, by which time all the contexts already ran.
          -- We could try squeezing in proper return tables during a refactoring session.
          -- For now, however, this works.
          card.destroyed = true

          card_eval_status_text(card, 'extra', nil, nil, nil,
            {
              message = localize('k_destroyed_ex'),
              colour = G.C.FILTER,
              delay = 0.45,
              extrafunc = function()
                SMODS.destroy_cards(card, nil, true)
              end
            }
          )
        else
          card_eval_status_text(card, 'extra', nil, nil, nil,
            {
              message = localize('k_supercritical_reset'),
              colour = G.C.FILTER,
              delay = 0.45,
              extrafunc = function()
                card.ability.extra.supercritical_stage = 0
              end
            }
          )
        end

        if left_joker and not left_joker.destroyed and not left_joker.ability.eternal then
          left_joker.destroyed = true

          card_eval_status_text(left_joker, 'extra', nil, nil, nil,
            {
              message = localize('k_destroyed_ex'),
              colour = G.C.FILTER,
              delay = 0.45,
              extrafunc = function()
                SMODS.destroy_cards(left_joker, nil, true)
              end
            }
          )
        end

        if right_joker and not right_joker.destroyed and not right_joker.ability.eternal then
          right_joker.destroyed = true

          card_eval_status_text(right_joker, 'extra', nil, nil, nil,
            {
              message = localize('k_destroyed_ex'),
              colour = G.C.FILTER,
              delay = 0.45,
              extrafunc = function()
                SMODS.destroy_cards(right_joker, nil, true)
              end
            }
          )
        end
      else
        local last_factor = card.ability.extra.current_factor;
        card.ability.extra.current_factor = last_factor * 2
        card.ability.extra.delta_factor = card.ability.extra.current_factor - last_factor

        card_eval_status_text(card, 'extra', nil, nil, nil,
          {
            message = localize('k_supercritical_plus_one'),
            colour = G.C.FILTER,
            delay = 0.45
          }
        )
      end

      return {
        func = function()
          SMODS.calculate_context({ supercritical_calculated = true, supercritical_card = card })
          return true
        end
      }
    end
  end,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability and card.ability.set == "Joker" and card.ability.extra and card.ability.extra.supercritical_stage or
        0
      }
    }
  end
}
