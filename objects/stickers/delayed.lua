local delayed_rounds = 3

SMODS.Sticker {
  key = 'delayed',
  atlas = 'sns_stickers_atlas',
  badge_colour = HEX('6bc6ff'),
  pos = { x = 3, y = 2 },
  default_compat = true,
  needs_enabled_flag = true,
  sets = {
    Joker = true
  },
  rate = 0.3,
  should_apply = function(self, card, center, area, bypass_roll)
    local delayed_roll = pseudorandom("sns_delayed")
    return G.GAME.modifiers.enable_sns_delayed and card.config.center.sns_delayed_compat and
        ((delayed_roll > 0.4) and (delayed_roll <= 0.7)) and (area == G.shop_jokers or area == G.pack_cards)
  end,
  calculate = function(self, card, context)
    -- There's no explicit context check in here. However, a card can be part of a context, so this is probably okay.
    if card.added_to_deck and card.ability.set == 'Joker' and not card.ability.sns_delay_tally then
      card.ability.sns_delay_tally = delayed_rounds
      SMODS.debuff_card(card, true, "delay")
    end
  end,
  loc_vars = function(self, info_queue, card)
    if card.debuff then
      info_queue[#info_queue + 1] = G.P_CENTERS[card.config.center_key]
    end

    local is_debuffed_by_toxic = card.ability.debuff_sources and card.ability.debuff_sources['toxic']
    local delayed_tally_remaining_info = card.ability.sns_delay_tally or delayed_rounds .. ""
    local delayed_additional_info = " remaining"

    if is_debuffed_by_toxic then
      delayed_tally_remaining_info = ""
      delayed_additional_info = "Toxified - can't activate"
    end

    return {
      vars = {
        card.ability.delayed_rounds or 3,
        delayed_tally_remaining_info,
        delayed_additional_info
      }
    }
  end
}
