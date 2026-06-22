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
  calculate = function(self, card, context)
    if context.end_of_round and not context.repetition and not context.individual then
      local last_factor = card.ability.extra.current_factor;

      card.ability.extra.supercritical_stage = card.ability.extra.supercritical_stage + 1

      if card.ability.extra.supercritical_stage >= 5 then
        for i = 1, #G.jokers.cards do
          if G.jokers.cards[i] == card and not card.debuff then
            local left_joker = G.jokers.cards[i - 1]
            local right_joker = G.jokers.cards[i + 1]

            card.ability.extra.current_factor = card.ability.extra.original_factor
            card.ability.extra.delta_factor = card.ability.extra.current_factor - last_factor

            if not card.ability.eternal then
              SMODS.destroy_cards(card, nil, nil)
              card_eval_status_text(card, 'extra', nil, nil, nil,
                { message = localize('k_destroyed_ex'), colour = G.C.FILTER, delay = 0.45 })
            else
              card.ability.extra.supercritical_stage = 0
              card_eval_status_text(card, 'extra', nil, nil, nil,
                { message = localize('k_supercritical_reset'), colour = G.C.FILTER, delay = 0.45 })
            end

            if left_joker and not left_joker.ability.eternal then
              SMODS.destroy_cards(left_joker, nil, nil)
              card_eval_status_text(left_joker, 'extra', nil, nil, nil,
                { message = localize('k_destroyed_ex'), colour = G.C.FILTER, delay = 0.45 })
            end

            if right_joker and not right_joker.ability.eternal then
              SMODS.destroy_cards(right_joker, nil, nil)
              card_eval_status_text(right_joker, 'extra', nil, nil, nil,
                { message = localize('k_destroyed_ex'), colour = G.C.FILTER, delay = 0.45 })
            end
          end
        end
      else
        local last_factor = card.ability.extra.current_factor;
        card.ability.extra.current_factor = last_factor * 2
        card.ability.extra.delta_factor = card.ability.extra.current_factor - last_factor

        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize('k_supercritical_plus_one'), colour = G.C.FILTER, delay = 0.45 })
      end
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
