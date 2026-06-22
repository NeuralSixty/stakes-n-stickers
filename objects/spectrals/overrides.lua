SMODS.Consumable:take_ownership('ankh', {
  use = function(self, card, area, copier)
    local deletable_jokers = {}
    for _, joker in ipairs(G.jokers.cards) do
      if not SMODS.is_eternal(joker, card) then deletable_jokers[#deletable_jokers + 1] = joker end
    end

    local chosen_joker = pseudorandom_element(G.jokers.cards, 'sns_ankh_choice')
    local _first_dissolve = nil
    G.E_MANAGER:add_event(Event({
      trigger = 'before',
      delay = 0.75,
      func = function()
        for _, joker in ipairs(deletable_jokers) do
          if joker ~= chosen_joker then
            joker:start_dissolve(nil, _first_dissolve)
            _first_dissolve = true
          end
        end
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'before',
      delay = 0.4,
      func = function()
        local chosen_joker_has_normal_negative = chosen_joker and chosen_joker.edition and chosen_joker.edition.negative
          and not ((chosen_joker.ability and chosen_joker.ability.eternal and chosen_joker.ability.perishable)
            or (chosen_joker.ability and chosen_joker.ability.eternal and chosen_joker.debuff
              and (chosen_joker.ability.debuff_sources and chosen_joker.ability.debuff_sources['toxic'])
            )
          )
        local copied_joker = copy_card(chosen_joker, nil, nil, nil, chosen_joker_has_normal_negative)
        local copied_joker_has_normal_negative = copied_joker.edition and copied_joker.edition.negative
          and not ((copied_joker.ability and copied_joker.ability.eternal and copied_joker.ability.perishable)
            or (copied_joker.ability and copied_joker.ability.eternal and copied_joker.debuff
              and (copied_joker.ability.debuff_sources and copied_joker.ability.debuff_sources['toxic'])
            )
          )
        copied_joker:start_materialize()
        copied_joker:add_to_deck()
        if copied_joker_has_normal_negative then
          copied_joker:set_edition(nil, true)
        end
        G.jokers:emplace(copied_joker)
        return true
      end
    }))
  end
}, true)
