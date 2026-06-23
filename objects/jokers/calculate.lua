SMODS.current_mod.calculate = function(self, context)
  for k, card in pairs(G.jokers.cards) do
    if context.end_of_round and not context.repetition and not context.individual then
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
