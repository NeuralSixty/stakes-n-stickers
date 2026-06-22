SMODS.Joker:take_ownership('joker', {
  name = "Joker SNS",
  sns_rental_compat = true,
  snst_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  snsupercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 4 }, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('greedy_joker', {
  name = "Greedy Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, s_mult = 3, suit = 'Diamonds' }, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.s_mult * card.ability.extra.current_factor, localize(card.ability.extra.suit, 'suits_singular') } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        context.other_card:is_suit(card.ability.extra.suit) then
      return {
        mult = card.ability.extra.s_mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('lusty_joker', {
  name = "Lusty Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, s_mult = 3, suit = 'Hearts' }, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.s_mult * card.ability.extra.current_factor, localize(card.ability.extra.suit, 'suits_singular') } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        context.other_card:is_suit(card.ability.extra.suit) then
      return {
        mult = card.ability.extra.s_mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('wrathful_joker', {
  name = "Wrathful Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, s_mult = 3, suit = 'Spades' }, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.s_mult * card.ability.extra.current_factor, localize(card.ability.extra.suit, 'suits_singular') } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        context.other_card:is_suit(card.ability.extra.suit) then
      return {
        mult = card.ability.extra.s_mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('gluttenous_joker', {
  name = "Gluttonous Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, s_mult = 3, suit = 'Clubs' }, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.s_mult * card.ability.extra.current_factor, localize(card.ability.extra.suit, 'suits_singular') } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        context.other_card:is_suit(card.ability.extra.suit) then
      return {
        mult = card.ability.extra.s_mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('jolly', {
  name = "Jolly Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_mult = 8, type = 'Pair' }, },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_mult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        mult = card.ability.extra.t_mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('zany', {
  name = "Zany Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_mult = 12, type = 'Three of a Kind' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_mult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        mult = card.ability.extra.t_mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('mad', {
  name = "Mad Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_mult = 10, type = 'Two Pair' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_mult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        mult = card.ability.extra.t_mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('crazy', {
  name = "Crazy Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_mult = 12, type = 'Straight' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_mult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        mult = card.ability.extra.t_mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('droll', {
  name = "Droll Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_mult = 10, type = 'Flush' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_mult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        mult = card.ability.extra.t_mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('sly', {
  name = "Sly Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_chips = 50, type = 'Pair' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_chips * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        chips = card.ability.extra.t_chips * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('wily', {
  name = "Wily Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_chips = 100, type = 'Three of a Kind' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_chips * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        chips = card.ability.extra.t_chips * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('clever', {
  name = "Clever Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_chips = 80, type = 'Two Pair' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_chips * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        chips = card.ability.extra.t_chips * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('devious', {
  name = "Devious Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_chips = 100, type = 'Straight' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_chips * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        chips = card.ability.extra.t_chips * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('crafty', {
  name = "Crafty Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, t_chips = 80, type = 'Flush' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.t_chips * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        chips = card.ability.extra.t_chips * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('half', {
  name = "Half Joker SNS",
  pixel_size = { h = 95 / 1.7 },
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 20, size = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor, card.ability.extra.size } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and #context.full_hand <= card.ability.extra.size then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('stencil', {
  name = "Stencil SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor,
        G.jokers and
        math.max(1,
          ((G.jokers.config.card_limit - #G.jokers.cards) * card.ability.extra.current_factor) +
          (#SMODS.find_card("j_stencil", true) * card.ability.extra.current_factor)) or 1
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = math.max(1,
          ((G.jokers.config.card_limit - #G.jokers.cards) * card.ability.extra.current_factor) +
          (#SMODS.find_card("j_stencil", true) * card.ability.extra.current_factor))
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('four_fingers', {
  name = "Four Fingers SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
}, true)

SMODS.Joker:take_ownership('mime', {
  name = "Mime SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, repetitions = 1 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_time_plural") } or { localize("k_time_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
      return {
        repetitions = card.ability.extra.repetitions * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('credit_card', {
  name = "Credit Card SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, bankrupt_at = 20 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.bankrupt_at * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      G.GAME.bankrupt_at = G.GAME.bankrupt_at - (card.ability.extra.bankrupt_at * card.ability.extra.delta_factor)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.bankrupt_at = G.GAME.bankrupt_at - (card.ability.extra.bankrupt_at * card.ability.extra.current_factor)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.bankrupt_at = G.GAME.bankrupt_at + (card.ability.extra.bankrupt_at * card.ability.extra.current_factor)
  end
}, true)

SMODS.Joker:take_ownership('ceremonial', {
  name = "Ceremonial Dagger SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor * 2,
        localize("k_time_plural"),
        card.ability.extra
            .mult -- This is a scaling Joker that tracks current +Mult, therefore it already accounts for the current_factor when scaling
      }
    }
  end,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local my_pos = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          my_pos = i
          break
        end
      end
      if my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
        local sliced_card = G.jokers.cards[my_pos + 1]
        sliced_card.getting_sliced = true
        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
        G.E_MANAGER:add_event(Event({
          func = function()
            G.GAME.joker_buffer = 0
            card.ability.extra.mult = card.ability.extra.mult +
                (sliced_card.sell_cost * 2 * card.ability.extra.current_factor)
            card:juice_up(0.8, 0.8)
            sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
            play_sound('slice1', 0.96 + math.random() * 0.08)
            return true
          end
        }))
        return {
          message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult + (sliced_card.sell_cost * card.ability.extra.current_factor * 2) } },
          colour = G.C.RED,
          no_juice = true
        }
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('banner', {
  name = "Banner SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 30 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = G.GAME.current_round.discards_left *
            (card.ability.extra.chips * card.ability.extra.current_factor)
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('mystic_summit', {
  name = "Mystic Summit SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 15, d_remaining = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor, card.ability.extra.d_remaining } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.discards_left == card.ability.extra.d_remaining then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('marble', {
  name = "Marble Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    if not card.debuff then
      info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    end

    return {
      vars = {
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_card_plural") } or { localize("k_card_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      local stone_cards = {}

      for i = 1, card.ability.extra.current_factor do
        stone_cards[i] = SMODS.create_card { set = "Base", enhancement = "m_stone", area = G.discard }
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        stone_cards[i].playing_card = G.playing_card
        table.insert(G.playing_cards, stone_cards[i])

        G.E_MANAGER:add_event(Event({
          func = function()
            stone_cards[i]:start_materialize({ G.C.SECONDARY_SET.Enhanced })
            G.play:emplace(stone_cards[i])
            return true
          end
        }))
      end
      return {
        message = localize { type = 'variable', key = 'a_plus_stone', vars = { card.ability.extra.current_factor, (card.ability.extra.current_factor > 1 and { localize("k_stone_plural") } or { localize("k_stone_singular") })[1] } },
        colour = G.C.SECONDARY_SET.Enhanced,
        func = function()
          for i = 1, card.ability.extra.current_factor do
            G.E_MANAGER:add_event(Event({
              func = function()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                return true
              end
            }))
            draw_card(G.play, G.deck, 90, 'up')
            SMODS.calculate_context({ playing_card_added = true, cards = { stone_cards[i] } })
          end
        end
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('loyalty_card', {
  name = "Loyalty Card SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult = 4, every = 5, loyalty_remaining = 5 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.Xmult * card.ability.extra.current_factor,
        card.ability.extra.every + 1,
        localize { type = 'variable', key = (card.ability.extra.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { card.ability.extra.loyalty_remaining } }
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      card.ability.extra.loyalty_remaining = (card.ability.extra.every - 1 - (G.GAME.hands_played - card.ability.hands_played_at_create)) %
          (card.ability.extra.every + 1)
      if not context.blueprint then
        if card.ability.extra.loyalty_remaining == 0 then
          local eval = function(card) return card.ability.extra.loyalty_remaining == 0 and not G.RESET_JIGGLES end
          juice_card_until(card, eval, true)
        end
      end
      if card.ability.extra.loyalty_remaining == card.ability.extra.every then
        return {
          xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('8_ball', {
  --[[
    It's important to change the name of the Joker we're taking ownership over to something else
    in order to avoid parts of the vanilla code that specifically check for the Joker name
    and then check or modify properties that we want to take control over below.
    An exception to this is the Oops! All 6s Joker, where we still want to use the vanilla code
    for backwards compatibility reasons, so Oops! All 6s still needs to use the original name.
    ]]
  name = "8 Ball SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { odds = 4, current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'sns_8ball')

    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_card_plural") } or { localize("k_card_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      if (context.other_card:get_id() == 8) and SMODS.pseudorandom_probability(card, 'sns_8ball', 1, card.ability.extra.odds) then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + card.ability.extra.current_factor
        return {
          extra = {
            message = localize { type = 'variable', key = 'a_plus_tarot', vars = { card.ability.extra.current_factor, localize("k_tarot") } },
            message_card = card,
            func = function()
              for i = 1, card.ability.extra.current_factor do
                G.E_MANAGER:add_event(Event({
                  func = (function()
                    SMODS.add_card {
                      set = 'Tarot',
                      key_append = 'sns_8_ball'
                    }
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                    return true
                  end)
                }))
              end
            end
          },
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('misprint', {
  name = "Misprint SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, max = 23, min = 0 } },
  loc_vars = function(self, info_queue, card)
    local r_mults = {}
    for i = card.ability.extra.min, card.ability.extra.max * card.ability.extra.current_factor do
      r_mults[#r_mults + 1] = tostring(i)
    end
    local loc_mult = ' ' .. (localize('k_mult')) .. ' '
    main_start = {
      { n = G.UIT.T, config = { text = '  +', colour = G.C.MULT, scale = 0.32 } },
      { n = G.UIT.O, config = { object = DynaText({ string = r_mults, colours = { G.C.RED }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
      {
        n = G.UIT.O,
        config = {
          object = DynaText({
            string = {
              { string = 'rand()', colour = G.C.JOKER_GREY }, { string = "#@" .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11) .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1) or 'D'), colour = G.C.RED },
              loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult,
              loc_mult, loc_mult, loc_mult, loc_mult },
            colours = { G.C.UI.TEXT_DARK },
            pop_in_rate = 9999999,
            silent = true,
            random_element = true,
            pop_delay = 0.2011,
            scale = 0.32,
            min_cycle_time = 0
          })
        }
      },
    }
    return {
      -- The UI element still shows up for debuffed misprints,
      -- so we trick it into not showing by checking if it's contained in a fake card (tooltip)
      main_start = not card.debuff and main_start or nil
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = pseudorandom('sns_misprint', card.ability.extra.min,
          card.ability.extra.max * card.ability.extra.current_factor)
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('dusk', {
  name = "Dusk SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, repetitions = 1 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_time_plural") } or { localize("k_time_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and G.GAME.current_round.hands_left == 0 then
      return {
        repetitions = card.ability.extra.repetitions * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('raised_fist', {
  name = "Raised Fist SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor * 2,
        localize("k_time_plural")
      }
    }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      local temp_Mult, temp_ID = 15, 15
      local raised_card = nil
      for i = 1, #G.hand.cards do
        if temp_ID >= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) then
          temp_Mult = G.hand.cards[i].base.nominal
          temp_ID = G.hand.cards[i].base.id
          raised_card = G.hand.cards[i]
        end
      end
      if raised_card == context.other_card then
        if context.other_card.debuff then
          return {
            message = localize('k_debuffed'),
            colour = G.C.RED
          }
        else
          return {
            mult = 2 * temp_Mult * card.ability.extra.current_factor
          }
        end
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('chaos', {
  name = "Chaos the Clown SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, rerolls = 1 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.rerolls * card.ability.extra.current_factor,
        ((card.ability.extra.rerolls * card.ability.extra.current_factor) > 1 and { localize("k_reroll_plural") } or { localize("k_reroll_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      SMODS.change_free_rerolls(card.ability.extra.rerolls * card.ability.extra.delta_factor)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    SMODS.change_free_rerolls(card.ability.extra.rerolls * card.ability.extra.current_factor)
  end,
  remove_from_deck = function(self, card, from_debuff)
    SMODS.change_free_rerolls(-card.ability.extra.rerolls * card.ability.extra.current_factor)
  end
}, true)

SMODS.Joker:take_ownership('fibonacci', {
  name = "Fibonacci SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 8 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 2 or
          context.other_card:get_id() == 3 or
          context.other_card:get_id() == 5 or
          context.other_card:get_id() == 8 or
          context.other_card:get_id() == 14 then
        return {
          mult = card.ability.extra.mult * card.ability.extra.current_factor
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('steel_joker', {
  name = "Steel Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 0.2 } },
  loc_vars = function(self, info_queue, card)
    if not card.debuff then
      info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    end

    local steel_tally = 0
    if G.playing_cards then
      for _, playing_card in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
      end
    end
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor, 1 + card.ability.extra.xmult * steel_tally * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      local steel_tally = 0
      for _, playing_card in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
      end
      return {
        Xmult = 1 + card.ability.extra.xmult * steel_tally * card.ability.extra.current_factor,
      }
    end
  end,
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_steel') then
        return true
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('scary_face', {
  name = "Scary Face SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 30 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_face() then
      return {
        chips = card.ability.extra.chips * card.ability.extra.current_factor
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('abstract', {
  name = "Abstract Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor, card.ability.extra.mult * (G.jokers and #G.jokers.cards or 0) * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = card.ability.extra.mult * #G.jokers.cards * card.ability.extra.current_factor
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('delayed_grat', {
  name = "Delayed Gratification SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor } }
  end,
  calc_dollar_bonus = function(self, card)
    return G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0 and
        G.GAME.current_round.discards_left * card.ability.extra.dollars * card.ability.extra.current_factor or nil
  end
}, true)

SMODS.Joker:take_ownership('hack', {
  name = "Hack SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, repetitions = 1 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.repetitions * card.ability.extra.current_factor,
        ((card.ability.extra.repetitions * card.ability.extra.current_factor) > 1 and { localize("k_time_plural") } or { localize("k_time_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.other_card:get_id() == 2 or
          context.other_card:get_id() == 3 or
          context.other_card:get_id() == 4 or
          context.other_card:get_id() == 5 then
        return {
          repetitions = card.ability.extra.repetitions * card.ability.extra.current_factor
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('pareidolia', {
  name = "Pareidolia SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
}, true)

local card_is_face_ref = Card.is_face
function Card:is_face(from_boss)
  return card_is_face_ref(self, from_boss) or (self:get_id() and next(SMODS.find_card("j_pareidolia")))
end

SMODS.Joker:take_ownership('gros_michel', {
  name = "Gros Michel SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, odds = 6, mult = 15 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'sns_gros_michel')

    return {
      vars = {
        card.ability.extra.mult * card.ability.extra.current_factor,
        numerator,
        denominator
      }
    }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if SMODS.pseudorandom_probability(card, 'sns_gros_michel', 1, card.ability.extra.odds) then
        SMODS.destroy_cards(card, nil, nil, true)
        G.GAME.pool_flags.sns_gros_michel_extinct = true
        return {
          message = localize('k_extinct_ex')
        }
      else
        return {
          message = localize('k_safe_ex')
        }
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor
      }
    end
  end,
  in_pool = function(self, args)
    return not G.GAME.pool_flags.sns_gros_michel_extinct
  end
}, true)

SMODS.Joker:take_ownership('even_steven', {
  name = "Even Steven SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 4 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() <= 10 and
          context.other_card:get_id() >= 0 and
          context.other_card:get_id() % 2 == 0 then
        return {
          mult = card.ability.extra.mult * card.ability.extra.current_factor
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('odd_todd', {
  name = "Odd Todd SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 31 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if (context.other_card:get_id() <= 10 and
            context.other_card:get_id() >= 0 and
            context.other_card:get_id() % 2 == 1) or
          (context.other_card:get_id() == 14) then
        return {
          chips = card.ability.extra.chips * card.ability.extra.current_factor
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('scholar', {
  name = "Scholar SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 4, chips = 20 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor, card.ability.extra.chips * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor,
        chips = card.ability.extra.chips * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('business', {
  name = "Business Card SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, odds = 2, dollars = 2 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'sns_business')

    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.dollars * card.ability.extra.current_factor
      }
    }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        context.other_card:is_face() and
        SMODS.pseudorandom_probability(card, 'sns_business', 1, card.ability.extra.odds) then
      G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) +
          card.ability.extra.dollars * card.ability.extra.current_factor
      return {
        dollars = card.ability.extra.dollars * card.ability.extra.current_factor,
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.GAME.dollar_buffer = 0
              return true
            end
          }))
        end
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('supernova', {
  name = "Supernova SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        "(" .. localize("k_multiplied_by") .. " ",
        card.ability.extra.current_factor,
        ")"
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = G.GAME.hands[context.scoring_name].played * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('ride_the_bus', {
  name = "Ride the Bus SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult_gain = 1, mult = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult_gain * card.ability.extra.current_factor, card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local faces = false
      for _, playing_card in ipairs(context.scoring_hand) do
        if playing_card:is_face() then
          faces = true
          break
        end
      end
      if faces then
        local last_mult = card.ability.extra.mult
        card.ability.extra.mult = 0
        if last_mult > 0 then
          return {
            message = localize('k_reset')
          }
        end
      else
        card.ability.extra.mult = card.ability.extra.mult +
            (card.ability.extra.mult_gain * card.ability.extra.current_factor)
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('space', {
  name = "Space Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, odds = 4 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'sns_space')

    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_time_plural") } or { localize("k_time_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.before and SMODS.pseudorandom_probability(card, 'sns_space', 1, card.ability.extra.odds) then
      return {
        level_up = card.ability.extra.current_factor,
        message = localize('k_level_up_ex')
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('egg', {
  name = "Egg SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, price = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.price * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      card.ability.extra_value = card.ability.extra_value +
          (card.ability.extra.price * card.ability.extra.current_factor)
      card:set_cost()
      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('burglar', {
  name = "Burglar SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, hands = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.hands * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      G.E_MANAGER:add_event(Event({
        func = function()
          ease_discard(-G.GAME.current_round.discards_left, nil, true)
          ease_hands_played(card.ability.extra.hands * card.ability.extra.current_factor)
          SMODS.calculate_effect(
            { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands * card.ability.extra.current_factor } } },
            context.blueprint_card or card)
          return true
        end
      }))
      return nil, true
    end
  end
}, true)

SMODS.Joker:take_ownership('blackboard', {
  name = "Blackboard SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor, localize('Spades', 'suits_plural'), localize('Clubs', 'suits_plural') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      local all_black_suits = true
      for _, playing_card in ipairs(G.hand.cards) do
        if not playing_card:is_suit('Clubs', nil, true) and not playing_card:is_suit('Spades', nil, true) then
          all_black_suits = false
          break
        end
      end
      if all_black_suits then
        return {
          xmult = card.ability.extra.xmult * card.ability.extra.current_factor
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('runner', {
  name = "Runner SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 0, chip_mod = 15 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint and next(context.poker_hands['Straight']) then
      -- See note about SMODS Scaling Manipulation on the wiki
      card.ability.extra.chips = card.ability.extra.chips +
          (card.ability.extra.chip_mod * card.ability.extra.current_factor)
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.CHIPS,
      }
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('ice_cream', {
  name = "Ice Cream SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 100, chip_mod = 5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor, card.ability.extra.chip_mod * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.after and not context.blueprint then
      if (card.ability.extra.chips * card.ability.extra.current_factor) - (card.ability.extra.chip_mod * card.ability.extra.current_factor) <= 0 then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('k_melted_ex'),
          colour = G.C.CHIPS
        }
      else
        card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_mod
        return {
          message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chip_mod * card.ability.extra.current_factor } },
          colour = G.C.CHIPS
        }
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('dna', {
  name = "DNA SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, copy = 1 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.copy,
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_copy_plural") } or { localize("k_copy_singular") })
            [1],
        (card.ability.extra.current_factor > 1 and { localize("k_pronoun_plural") } or { localize("k_pronoun_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint then
      local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
    if context.before and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
      local copy_cards = {}

      for i = 1, card.ability.extra.current_factor do
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        copy_cards[i] = copy_card(context.full_hand[1], nil, nil, G.playing_card)
        copy_cards[i]:add_to_deck()
        G.deck.config.card_limit = G.deck.config.card_limit + 1
        table.insert(G.playing_cards, copy_cards[i])
        G.hand:emplace(copy_cards[i])
        copy_cards[i].states.visible = nil

        G.E_MANAGER:add_event(Event({
          func = function()
            copy_cards[i]:start_materialize()
            return true
          end
        }))
      end

      return {
        message = localize('k_copied_ex'),
        colour = G.C.CHIPS,
        func = function()
          for i = 1, card.ability.extra.current_factor do
            G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.calculate_context({ playing_card_added = true, cards = { copy_cards[i] } })
                return true
              end
            }))
          end
        end
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('splash', {
  name = "Splash SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  calculate = function(self, card, context)
    if context.modify_scoring_hand and not context.blueprint then
      return {
        add_to_hand = true
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('blue_joker', {
  name = "Blue Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor, card.ability.extra.chips * card.ability.extra.current_factor * ((G.deck and G.deck.cards) and #G.deck.cards or 52) } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.chips * card.ability.extra.current_factor * #G.deck.cards
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('sixth_sense', {
  name = "Sixth Sense SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_card_plural") } or { localize("k_card_singular") })
            [1],
      }
    }
  end,
  calculate = function(self, card, context)
    if context.destroy_card and not context.blueprint then
      if #context.full_hand == 1 and context.destroy_card == context.full_hand[1] and context.full_hand[1]:get_id() == 6 and G.GAME.current_round.hands_played == 0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + card.ability.extra.current_factor

        for i = 1, card.ability.extra.current_factor do
          G.E_MANAGER:add_event(Event({
            func = (function()
              SMODS.add_card {
                set = 'Spectral',
                key_append = 'sns_sixth_sense'
              }
              G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
              return true
            end)
          }))
        end

        return {
          message = localize('k_plus_spectral'),
          colour = G.C.SECONDARY_SET.Spectral,
          remove = true
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('constellation', {
  name = "Constellation SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult = 1, Xmult_mod = 0.1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult_mod * card.ability.extra.current_factor, card.ability.extra.Xmult } }
  end,
  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
      card.ability.extra.Xmult = card.ability.extra.Xmult +
          (card.ability.extra.Xmult_mod * card.ability.extra.current_factor)
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
      }
    end
    if context.joker_main then
      return {
        Xmult = card.ability.extra.Xmult
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('hiker', {
  name = "Hiker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
          (card.ability.extra.chips * card.ability.extra.current_factor)
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.CHIPS
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('faceless', {
  name = "Faceless Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 5, faces = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor, card.ability.extra.faces } }
  end,
  calculate = function(self, card, context)
    if context.discard and context.other_card == context.full_hand[#context.full_hand] then
      local face_cards = 0
      for _, discarded_card in ipairs(context.full_hand) do
        if discarded_card:is_face() then face_cards = face_cards + 1 end
      end
      if face_cards >= card.ability.extra.faces then
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) +
            (card.ability.extra.dollars * card.ability.extra.current_factor)
        return {
          dollars = card.ability.extra.dollars * card.ability.extra.current_factor,
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                G.GAME.dollar_buffer = 0
                return true
              end
            }))
          end
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('green_joker', {
  name = "Green Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, hand_add = 1, discard_sub = 1, mult = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.hand_add * card.ability.extra.current_factor, card.ability.extra.discard_sub * card.ability.extra.current_factor, card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.discard and not context.blueprint and context.other_card == context.full_hand[#context.full_hand] then
      local prev_mult = card.ability.extra.mult
      card.ability.extra.mult = math.max(0,
        card.ability.extra.mult - (card.ability.extra.discard_sub * card.ability.extra.current_factor))
      if card.ability.extra.mult ~= prev_mult then
        return {
          message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.discard_sub * card.ability.extra.current_factor } },
          colour = G.C.RED
        }
      end
    end
    if context.before and not context.blueprint then
      card.ability.extra.mult = card.ability.extra.mult +
          (card.ability.extra.hand_add * card.ability.extra.current_factor)
      return {
        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.hand_add * card.ability.extra.current_factor } }
      }
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('superposition', {
  name = "Superposition SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_card_plural") } or { localize("k_card_singular") })
            [1],
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands["Straight"]) and
        #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      local ace_check = false
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:get_id() == 14 then
          ace_check = true
          break
        end
      end
      if ace_check then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + card.ability.extra.current_factor

        for i = 1, card.ability.extra.current_factor do
          G.E_MANAGER:add_event(Event({
            func = (function()
              SMODS.add_card {
                set = 'Tarot',
                key_append = 'sns_superposition'
              }
              G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
              return true
            end)
          }))
        end
        return {
          message = localize('k_plus_tarot'),
          colour = G.C.SECONDARY_SET.Tarot,
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('todo_list', {
  name = "To Do List SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 4, poker_hand = 'High Card' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor, localize(card.ability.extra.poker_hand, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.before and context.scoring_name == card.ability.extra.poker_hand then
      G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) +
          (card.ability.extra.dollars * card.ability.extra.current_factor)
      return {
        dollars = card.ability.extra.dollars * card.ability.extra.current_factor,
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.GAME.dollar_buffer = 0
              return true
            end
          }))
        end
      }
    end
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      local _poker_hands = {}
      for handname, _ in pairs(G.GAME.hands) do
        if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
          _poker_hands[#_poker_hands + 1] = handname
        end
      end
      card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'sns_to_do')
      return {
        message = localize('k_reset')
      }
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    local _poker_hands = {}
    for handname, _ in pairs(G.GAME.hands) do
      if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
        _poker_hands[#_poker_hands + 1] = handname
      end
    end
    card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'sns_to_do')
  end
}, true)

SMODS.Joker:take_ownership('cavendish', {
  name = "Cavendish SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, odds = 1000, Xmult = 3 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'sns_cavendish')

    return {
      vars = {
        card.ability.extra.Xmult * card.ability.extra.current_factor,
        numerator,
        denominator
      }
    }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if SMODS.pseudorandom_probability(card, 'sns_cavendish', 1, card.ability.extra.odds) then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('k_extinct_ex')
        }
      else
        return {
          message = localize('k_safe_ex')
        }
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    end
  end,
  in_pool = function(self, args)
    return G.GAME.pool_flags.sns_gros_michel_extinct
  end
}, true)

SMODS.Joker:take_ownership('card_sharp', {
  name = "Card Sharp SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
      return {
        xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('red_card', {
  name = "Red Card SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult_gain = 3, mult = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult_gain * card.ability.extra.current_factor, card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.skipping_booster and not context.blueprint then
      card.ability.extra.mult = card.ability.extra.mult +
          (card.ability.extra.mult_gain * card.ability.extra.current_factor)
      return {
        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_gain * card.ability.extra.current_factor } },
        colour = G.C.RED,
      }
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('madness', {
  name = "Madness SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult_gain = 0.5, xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_gain * card.ability.extra.current_factor, card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint and not context.blind.boss then
      card.ability.extra.xmult = card.ability.extra.xmult +
          (card.ability.extra.xmult_gain * card.ability.extra.current_factor)
      local destructable_jokers = {}
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) and not G.jokers.cards[i].getting_sliced then
          destructable_jokers[#destructable_jokers + 1] =
              G.jokers.cards[i]
        end
      end
      local joker_to_destroy = pseudorandom_element(destructable_jokers, 'sns_madness')

      if joker_to_destroy then
        joker_to_destroy.getting_sliced = true
        G.E_MANAGER:add_event(Event({
          func = function()
            (context.blueprint_card or card):juice_up(0.8, 0.8)
            joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
            return true
          end
        }))
      end
      return { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } } }
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('square', {
  name = "Square Joker SNS",
  pixel_size = { h = 71 },
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 0, chip_mod = 4 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint and #context.full_hand == 4 then
      card.ability.extra.chips = card.ability.extra.chips +
          (card.ability.extra.chip_mod * card.ability.extra.current_factor)
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.CHIPS
      }
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('seance', {
  name = "Seance SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, poker_hand = 'Straight Flush' } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.poker_hand, 'poker_hands'),
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_card_plural") } or { localize("k_card_singular") })
            [1],
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.poker_hand]) and
        #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + card.ability.extra.current_factor

      for i = 1, card.ability.extra.current_factor do
        G.E_MANAGER:add_event(Event({
          func = (function()
            SMODS.add_card {
              set = 'Spectral',
              key_append = 'sns_seance'
            }
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
            return true
          end)
        }))
      end
      return {
        message = localize('k_plus_spectral'),
        colour = G.C.SECONDARY_SET.Spectral
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('riff_raff', {
  name = "Riff-Raff SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, creates = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.creates * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
      local jokers_to_create = math.min(card.ability.extra.creates * card.ability.extra.current_factor,
        G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
      G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
      G.E_MANAGER:add_event(Event({
        func = function()
          for _ = 1, jokers_to_create do
            local card = SMODS.add_card {
              set = 'Joker',
              rarity = 'Common',
              allow_duplicates = false,
              discover = true,
              key_append = 'sns_riff_raff',
            }
            G.GAME.joker_buffer = 0
          end
          return true
        end
      }))
      return {
        message = localize('k_plus_joker'),
        colour = G.C.BLUE,
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('vampire', {
  name = "Vampire SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult_gain = 0.1, Xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult_gain * card.ability.extra.current_factor, card.ability.extra.Xmult } }
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local enhanced = {}
      for _, scored_card in ipairs(context.scoring_hand) do
        if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.vampired then
          enhanced[#enhanced + 1] = scored_card
          scored_card.vampired = true
          scored_card:set_ability('c_base', nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              scored_card:juice_up()
              scored_card.vampired = nil
              return true
            end
          }))
        end
      end

      if #enhanced > 0 then
        card.ability.extra.Xmult = card.ability.extra.Xmult +
            card.ability.extra.Xmult_gain * #enhanced * card.ability.extra.current_factor
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
          colour = G.C.MULT
        }
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.Xmult
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('shortcut', {
  name = "Shortcut SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
}, true)

local smods_shortcut_ref = SMODS.shortcut
function SMODS.shortcut()
  if next(SMODS.find_card('j_shortcut')) then
    return true
  end
  return smods_shortcut_ref()
end

SMODS.Joker:take_ownership('hologram', {
  name = "Hologram SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  soul_pos = {
    x = 2,
    y = 9,
    draw = function(card, scale_mod, rotate_mod)
      card.hover_tilt = card.hover_tilt * 1.5
      card.children.floating_sprite:draw_shader('hologram', nil, card.ARGS.send_to_shader, nil,
        card.children.center, 2 * scale_mod, 2 * rotate_mod)
      card.hover_tilt = card.hover_tilt / 1.5
    end
  },
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult_gain = 0.25, Xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult_gain * card.ability.extra.current_factor, card.ability.extra.Xmult } }
  end,
  calculate = function(self, card, context)
    if context.playing_card_added and not context.blueprint then
      card.ability.extra.Xmult = card.ability.extra.Xmult +
          #context.cards * card.ability.extra.Xmult_gain * card.ability.extra.current_factor
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
      }
    end
    if context.joker_main then
      return {
        Xmult = card.ability.extra.Xmult
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('vagabond', {
  name = "Vagabond SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 4 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.dollars,
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_card_plural") } or { localize("k_card_singular") })
            [1],
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main and
        #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      if G.GAME.dollars <= card.ability.extra.dollars then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + card.ability.extra.current_factor

        for i = 1, card.ability.extra.current_factor do
          G.E_MANAGER:add_event(Event({
            func = (function()
              SMODS.add_card {
                set = 'Tarot',
                key_append = 'sns_vagabond'
              }
              G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
              return true
            end)
          }))
        end
        return {
          message = localize('k_plus_tarot'),
        }
      end
    end
  end,
}, true)

SMODS.Joker:take_ownership('baron', {
  name = "Baron SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 1.5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 13 then
      if context.other_card.debuff then
        return {
          message = localize('k_debuffed'),
          colour = G.C.RED
        }
      else
        return {
          x_mult = card.ability.extra.xmult * card.ability.extra.current_factor
        }
      end
    end
  end,
}, true)

SMODS.Joker:take_ownership('cloud_9', {
  name = "Cloud 9 SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 1 } },
  loc_vars = function(self, info_queue, card)
    local nine_tally = 0
    if G.playing_cards then
      for _, playing_card in ipairs(G.playing_cards) do
        if playing_card:get_id() == 9 then nine_tally = nine_tally + 1 end
      end
    end
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor, card.ability.extra.dollars * nine_tally * card.ability.extra.current_factor } }
  end,
  calc_dollar_bonus = function(self, card)
    local nine_tally = 0
    for _, playing_card in ipairs(G.playing_cards) do
      if playing_card:get_id() == 9 then nine_tally = nine_tally + 1 end
    end
    return nine_tally > 0 and card.ability.extra.dollars * nine_tally * card.ability.extra.current_factor or nil
  end
}, true)

SMODS.Joker:take_ownership('rocket', {
  name = "Rocket SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 1, increase = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars, card.ability.extra.increase * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
      -- See note about SMODS Scaling Manipulation on the wiki
      card.ability.extra.dollars = card.ability.extra.dollars +
          card.ability.extra.increase * card.ability.extra.current_factor
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MONEY
      }
    end
  end,
  calc_dollar_bonus = function(self, card)
    return card.ability.extra.dollars
  end
}, true)

SMODS.Joker:take_ownership('obelisk', {
  name = "Obelisk SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult_gain = 0.2, Xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult_gain * card.ability.extra.current_factor, card.ability.extra.Xmult } }
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local reset = true
      local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
      for handname, values in pairs(G.GAME.hands) do
        if handname ~= context.scoring_name and values.played >= play_more_than and SMODS.is_poker_hand_visible(handname) then
          reset = false
          break
        end
      end
      if reset then
        if card.ability.extra.Xmult > 1 then
          card.ability.extra.Xmult = 1
          return {
            message = localize('k_reset')
          }
        end
      else
        card.ability.extra.Xmult = card.ability.extra.Xmult +
            (card.ability.extra.Xmult_gain * card.ability.extra.current_factor)
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.Xmult
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('midas_mask', {
  name = "Midas Mask SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  loc_vars = function(self, info_queue, card)
    if not card.debuff then
      info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    end
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local faces = 0
      for _, scored_card in ipairs(context.scoring_hand) do
        if scored_card:is_face() then
          faces = faces + 1
          scored_card:set_ability('m_gold', nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              scored_card:juice_up()
              return true
            end
          }))
        end
      end
      if faces > 0 then
        return {
          message = localize('k_gold'),
          colour = G.C.MONEY
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('luchador', {
  name = "Luchador SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  loc_vars = function(self, info_queue, card)
    local main_end = nil
    if card.area and (card.area == G.jokers) then
      local disableable = G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.boss))
      main_end = {
        {
          n = G.UIT.C,
          config = { align = "bm", minh = 0.4 },
          nodes = {
            {
              n = G.UIT.C,
              config = { ref_table = card, align = "m", colour = disableable and G.C.GREEN or G.C.RED, r = 0.05, padding = 0.06 },
              nodes = {
                { n = G.UIT.T, config = { text = ' ' .. localize(disableable and 'k_active' or 'ph_no_boss_active') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.9 } },
              }
            }
          }
        }
      }
    end
    return { main_end = main_end }
  end,
  calculate = function(self, card, context)
    if context.selling_self then
      if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
        return {
          message = localize('ph_boss_disabled'),
          func = function()
            G.GAME.blind:disable()
          end
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('photograph', {
  name = "Photograph SNS",
  pixel_size = { h = 95 / 1.2 },
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_face() then
      local is_first_face = false
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:is_face() then
          is_first_face = context.scoring_hand[i] == context.other_card
          break
        end
      end
      if is_first_face then
        return {
          xmult = card.ability.extra.xmult * card.ability.extra.current_factor
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('gift', {
  name = "Gift Card SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, sell_value = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.sell_value * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      for _, area in ipairs({ G.jokers, G.consumeables }) do
        for _, other_card in ipairs(area.cards) do
          if other_card.set_cost then
            other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
                card.ability.extra.sell_value * card.ability.extra.current_factor
            other_card:set_cost()
          end
        end
      end
      return {
        message = localize('k_val_up'),
        colour = G.C.MONEY
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('turtle_bean', {
  name = "Turtle Bean SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, h_size = 5, h_mod = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.h_size * card.ability.extra.current_factor, card.ability.extra.h_mod * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if (card.ability.extra.h_size * card.ability.extra.current_factor) - (card.ability.extra.h_mod * card.ability.extra.current_factor) <= 0 then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER
        }
      else
        card.ability.extra.h_size = card.ability.extra.h_size - card.ability.extra.h_mod
        G.hand:change_size(-(card.ability.extra.h_mod * card.ability.extra.current_factor))
        return {
          message = localize { type = 'variable', key = 'a_handsize_minus', vars = { card.ability.extra.h_mod * card.ability.extra.current_factor } },
          colour = G.C.FILTER
        }
      end
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.h_size * card.ability.extra.current_factor)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-(card.ability.extra.h_size * card.ability.extra.current_factor))
  end
}, true)

SMODS.Joker:take_ownership('erosion', {
  name = "Erosion SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 4 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor, math.max(0, card.ability.extra.mult * (G.playing_cards and (G.GAME.starting_deck_size - #G.playing_cards) or 0) * card.ability.extra.current_factor), G.GAME.starting_deck_size } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = math.max(0,
          card.ability.extra.mult * (G.GAME.starting_deck_size - #G.playing_cards) *
          card.ability.extra.current_factor)
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('reserved_parking', {
  name = "Reserved Parking SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, odds = 2, dollars = 1 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
      'sns_reserved_parking')

    return {
      vars = {
        card.ability.extra.dollars * card.ability.extra.current_factor,
        numerator,
        denominator,
      }
    }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if context.other_card:is_face() and
          SMODS.pseudorandom_probability(card, 'sns_reserved_parking', 1, card.ability.extra.odds) then
        if context.other_card.debuff then
          return {
            message = localize('k_debuffed'),
            colour = G.C.RED
          }
        else
          G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) +
              card.ability.extra.dollars * card.ability.extra.current_factor
          return {
            dollars = card.ability.extra.dollars * card.ability.extra.current_factor,
            func = function()
              G.E_MANAGER:add_event(Event({
                func = function()
                  G.GAME.dollar_buffer = 0
                  return true
                end
              }))
            end
          }
        end
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('mail', {
  name = "Mail-In Rebate SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor, localize((G.GAME.current_round.sns_mail_card or {}).rank or 'Ace', 'ranks') } }
  end,
  calculate = function(self, card, context)
    if context.discard and not context.other_card.debuff and
        context.other_card:get_id() == G.GAME.current_round.sns_mail_card.id then
      G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) +
          card.ability.extra.dollars * card.ability.extra.current_factor
      return {
        dollars = card.ability.extra.dollars * card.ability.extra.current_factor,
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.GAME.dollar_buffer = 0
              return true
            end
          }))
        end
      }
    end
  end
}, true)

local function reset_sns_mail_rank()
  G.GAME.current_round.sns_mail_card = { rank = 'Ace' }
  local valid_mail_cards = {}
  for _, playing_card in ipairs(G.playing_cards) do
    if not SMODS.has_no_rank(playing_card) then
      valid_mail_cards[#valid_mail_cards + 1] = playing_card
    end
  end
  local mail_card = pseudorandom_element(valid_mail_cards, 'sns_mail' .. G.GAME.round_resets.ante)
  if mail_card then
    G.GAME.current_round.sns_mail_card.rank = mail_card.base.value
    G.GAME.current_round.sns_mail_card.id = mail_card.base.id
  end
end


SMODS.Joker:take_ownership('to_the_moon', {
  name = "To the Moon SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, interest = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.interest * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      G.GAME.interest_amount = G.GAME.interest_amount +
          (card.ability.extra.interest * card.ability.extra.delta_factor)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.interest_amount = G.GAME.interest_amount + card.ability.extra.interest * card.ability.extra
        .current_factor
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.interest_amount = G.GAME.interest_amount - card.ability.extra.interest * card.ability.extra
        .current_factor
  end
}, true)

SMODS.Joker:take_ownership('hallucination', {
  name = "Hallucination SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, odds = 2 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds,
      'sns_hallucination' .. G.GAME.round_resets.ante)

    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_card_plural") } or { localize("k_card_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.open_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      if SMODS.pseudorandom_probability(card, 'sns_hallucination' .. G.GAME.round_resets.ante, 1, card.ability.extra.odds) then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + card.ability.extra.current_factor

        for i = 1, card.ability.extra.current_factor do
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
              SMODS.add_card {
                set = 'Tarot',
                key_append = 'sns_hallucination'
              }
              G.GAME.consumeable_buffer = 0
              return true
            end)
          }))
        end
        return {
          message = localize('k_plus_tarot'),
          colour = G.C.PURPLE,
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('fortune_teller', {
  name = "Fortune Teller SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor, card.ability.extra.mult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0) * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "Tarot" then
      return {
        message = localize { type = 'variable', key = 'a_mult', vars = { G.GAME.consumeable_usage_total.tarot } },
      }
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult *
            (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0) *
            card.ability.extra.current_factor
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('juggler', {
  name = "Juggler SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, h_size = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.h_size * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      -- There's a case where the Joker gets destroyed and the hand size is shown wrong.
      -- Even though the hand size gets recalculated in the next round, it's still not pretty.
      -- TODO: Find a way to take care of this visual bug.
      G.hand:change_size(card.ability.extra.h_size * card.ability.extra.delta_factor)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.h_size * card.ability.extra.current_factor)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.h_size * card.ability.extra.current_factor)
  end
}, true)

SMODS.Joker:take_ownership('drunkard', {
  name = "Drunkard SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, d_size = 1 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.d_size * card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_discard_plural") } or { localize("k_discard_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      G.GAME.round_resets.discards = G.GAME.round_resets.discards +
          (card.ability.extra.d_size * card.ability.extra.delta_factor)
      ease_discard(card.ability.extra.d_size * card.ability.extra.delta_factor)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards +
        (card.ability.extra.d_size * card.ability.extra.current_factor)
    -- We don't want to confuse the player with the ease effect
    -- if the card is supposed to be delayed when being added.
    -- It's better not to visually show anything at all in this case.
    -- Same thing occurs for remove_from_deck and across all other Jokers
    -- that modify the game state when added or removed.
    if not card.ability.sns_delayed then
      ease_discard(card.ability.extra.d_size * card.ability.extra.current_factor)
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards -
        (card.ability.extra.d_size * card.ability.extra.current_factor)

    if not card.ability.sns_delayed then
      ease_discard(-card.ability.extra.d_size * card.ability.extra.current_factor)
    end
  end
}, true)

SMODS.Joker:take_ownership('stone', {
  name = "Stone Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 25 } },
  loc_vars = function(self, info_queue, card)
    if not card.debuff then
      info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    end

    local stone_tally = 0
    if G.playing_cards then
      for _, playing_card in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
      end
    end
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor, card.ability.extra.chips * stone_tally * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      local stone_tally = 0
      for _, playing_card in ipairs(G.playing_cards) do
        if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
      end
      return {
        chips = card.ability.extra.chips * stone_tally * card.ability.extra.current_factor
      }
    end
  end,
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_stone') then
        return true
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('golden', {
  name = "Golden Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 4 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor } }
  end,
  calc_dollar_bonus = function(self, card)
    return card.ability.extra.dollars * card.ability.extra.current_factor
  end
}, true)

SMODS.Joker:take_ownership('lucky_cat', {
  name = "Lucky Cat SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult_gain = 0.25, Xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    if not card.debuff then
      info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
    end

    return { vars = { card.ability.extra.Xmult_gain * card.ability.extra.current_factor, card.ability.extra.Xmult } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not context.blueprint then
      card.ability.extra.Xmult = card.ability.extra.Xmult +
          (card.ability.extra.Xmult_gain * card.ability.extra.current_factor)
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.MULT,
        message_card = card
      }
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.Xmult
      }
    end
  end,
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_lucky') then
        return true
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('baseball', {
  name = "Baseball Card SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 1.5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.other_joker and (context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon") then
      return {
        xmult = card.ability.extra.xmult * card.ability.extra.current_factor
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('bull', {
  name = "Bull SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor, card.ability.extra.chips * math.max(0, (G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.chips * math.max(0, (G.GAME.dollars + (G.GAME.dollar_buffer or 0))) *
            card.ability.extra.current_factor
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('diet_cola', {
  name = "Diet Cola SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    if not card.debuff then
      info_queue[#info_queue + 1] = { key = 'tag_double', set = 'Tag' }
    end

    return {
      vars = {
        (card.ability.extra.current_factor > 1 and { localize("k_double_tag_plural") } or { localize("k_double_tag_singular") })
            [1],
        card.ability.extra.current_factor
      }
    }
  end,
  calculate = function(self, card, context)
    if context.selling_self then
      for i = 1, card.ability.extra.current_factor do
        G.E_MANAGER:add_event(Event({
          func = (function()
            add_tag(Tag('tag_double'))
            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)

            return true
          end)
        }))
      end

      return nil, true
    end
  end,
}, true)

SMODS.Joker:take_ownership('trading', {
  name = "Trading Card SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.first_hand_drawn then
      local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
    if context.discard and not context.blueprint and
        G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
      return {
        dollars = card.ability.extra.dollars * card.ability.extra.current_factor,
        remove = true
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('flash', {
  name = "Flash Card SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult_gain = 2, mult = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult_gain * card.ability.extra.current_factor, card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.reroll_shop and not context.blueprint then
      card.ability.extra.mult = card.ability.extra.mult +
          (card.ability.extra.mult_gain * card.ability.extra.current_factor)
      return {
        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
        colour = G.C.MULT,
      }
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('popcorn', {
  name = "Popcorn SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult_loss = 4, mult = 20 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor, card.ability.extra.mult_loss * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if (card.ability.extra.mult * card.ability.extra.current_factor) - (card.ability.extra.mult_loss * card.ability.extra.current_factor) <= 0 then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.RED
        }
      else
        card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
        return {
          message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult_loss * card.ability.extra.current_factor } },
          colour = G.C.MULT
        }
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('trousers', {
  name = "Spare Trousers SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult_gain = 2, mult = 0 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult_gain * card.ability.extra.current_factor, localize('Two Pair', 'poker_hands'), card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint and (next(context.poker_hands['Two Pair']) or next(context.poker_hands['Full House'])) then
      card.ability.extra.mult = card.ability.extra.mult +
          (card.ability.extra.mult_gain * card.ability.extra.current_factor)
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.RED
      }
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('ancient', {
  name = "Ancient Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 1.5 } },
  loc_vars = function(self, info_queue, card)
    local suit = (G.GAME.current_round.sns_ancient_card or {}).suit or 'Spades'
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor, localize(suit, 'suits_singular'), colours = { G.C.SUITS[suit] } } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(G.GAME.current_round.sns_ancient_card.suit) then
      return {
        xmult = card.ability.extra.xmult * card.ability.extra.current_factor
      }
    end
  end
}, true)

local function reset_sns_ancient_card()
  G.GAME.current_round.sns_ancient_card = G.GAME.current_round.sns_ancient_card or { suit = 'Spades' }
  local ancient_suits = {}
  for k, v in ipairs({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
    if v ~= G.GAME.current_round.sns_ancient_card.suit then ancient_suits[#ancient_suits + 1] = v end
  end
  local ancient_card = pseudorandom_element(ancient_suits, 'sns_ancient' .. G.GAME.round_resets.ante)
  G.GAME.current_round.sns_ancient_card.suit = ancient_card
end

SMODS.Joker:take_ownership('ramen', {
  name = "Ramen SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult_loss = 0.01, Xmult = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult * card.ability.extra.current_factor, card.ability.extra.Xmult_loss * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.discard and not context.blueprint then
      if (card.ability.extra.Xmult * card.ability.extra.current_factor) - (card.ability.extra.Xmult_loss * card.ability.extra.current_factor) <= 1 then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.FILTER
        }
      else
        card.ability.extra.Xmult = card.ability.extra.Xmult - card.ability.extra.Xmult_loss
        return {
          message = localize { type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.Xmult_loss * card.ability.extra.current_factor } },
          colour = G.C.RED
        }
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('walkie_talkie', {
  name = "Walkie Talkie SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 10, mult = 4 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor, card.ability.extra.mult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        (context.other_card:get_id() == 10 or context.other_card:get_id() == 4) then
      return {
        chips = card.ability.extra.chips * card.ability.extra.current_factor,
        mult = card.ability.extra.mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('selzer', {
  name = "Seltzer SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, hands_left = 10 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.hands_left,
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_time_plural") } or { localize("k_time_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      return {
        repetitions = card.ability.extra.current_factor
      }
    end
    if context.after and not context.blueprint then
      if card.ability.extra.hands_left - 1 <= 0 then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
          message = localize('k_drank_ex'),
          colour = G.C.FILTER
        }
      else
        card.ability.extra.hands_left = card.ability.extra.hands_left - 1
        return {
          message = card.ability.extra.hands_left .. '',
          colour = G.C.FILTER
        }
      end
    end
  end
}, true)

SMODS.Joker:take_ownership('castle', {
  name = "Castle SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 0, chip_mod = 3 } },
  loc_vars = function(self, info_queue, card)
    local suit = (G.GAME.current_round.sns_castle_card or {}).suit or 'Spades'
    return { vars = { card.ability.extra.chip_mod * card.ability.extra.current_factor, localize(suit, 'suits_singular'), card.ability.extra.chips, colours = { G.C.SUITS[suit] } } }
  end,
  calculate = function(self, card, context)
    if context.discard and not context.blueprint and not context.other_card.debuff and
        context.other_card:is_suit(G.GAME.current_round.sns_castle_card.suit) then
      card.ability.extra.chips = card.ability.extra.chips +
          (card.ability.extra.chip_mod * card.ability.extra.current_factor)
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.CHIPS
      }
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
}, true)

local function reset_sns_castle_card()
  G.GAME.current_round.sns_castle_card = { suit = 'Spades' }
  local valid_castle_cards = {}
  for _, playing_card in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(playing_card) then
      valid_castle_cards[#valid_castle_cards + 1] = playing_card
    end
  end
  local castle_card = pseudorandom_element(valid_castle_cards,
    'sns_castle' .. G.GAME.round_resets.ante)
  if castle_card then
    G.GAME.current_round.sns_castle_card.suit = castle_card.base.suit
  end
end

SMODS.Joker:take_ownership('smiley', {
  name = "Smiley Face SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_face() then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor
      }
    end
  end
}, true)

SMODS.Joker:take_ownership('campfire', {
  name = "Campfire SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult_gain = 0.25, xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_gain * card.ability.extra.current_factor, card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.selling_card and not context.blueprint then
      card.ability.extra.xmult = card.ability.extra.xmult +
          (card.ability.extra.xmult_gain * card.ability.extra.current_factor)
      return {
        message = localize('k_upgrade_ex')
      }
    end
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if context.beat_boss and card.ability.extra.xmult > 1 then
        card.ability.extra.xmult = 1
        return {
          message = localize('k_reset'),
          colour = G.C.RED
        }
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end
}, true)

-- From now on the Jokers have unlock conditions, need to recheck if the SMODS functions
-- dealing with unlock conditions are working correctly.

SMODS.Joker:take_ownership('ticket', {
  name = "Golden Ticket SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 4 } },
  loc_vars = function(self, info_queue, card)
    if not card.debuff then
      info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    end

    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        SMODS.has_enhancement(context.other_card, 'm_gold') then
      G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
      return {
        dollars = card.ability.extra.dollars * card.ability.extra.current_factor,
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.GAME.dollar_buffer = 0
              return true
            end
          }))
        end
      }
    end
  end,
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_gold') then
        return true
      end
    end
    return false
  end,
  check_for_unlock = function(self, args)
    if args.type == 'hand_contents' then
      local tally = 0
      for j = 1, #args.cards do
        if SMODS.has_enhancement(args.cards[j], 'm_gold') then
          tally = tally + 1
          if tally == 5 then
            return true
          end
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('mr_bones', {
  name = "Mr. Bones SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, saved_threshold = 0.25 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { (card.ability.extra.saved_threshold / card.ability.extra.current_factor) * 100 } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over and context.main_eval then
      if G.GAME.chips / G.GAME.blind.chips >= (card.ability.extra.saved_threshold / card.ability.extra.current_factor) then
        G.E_MANAGER:add_event(Event({
          func = function()
            G.hand_text_area.blind_chips:juice_up()
            G.hand_text_area.game_chips:juice_up()
            play_sound('tarot1')
            card:start_dissolve()
            return true
          end
        }))
        return {
          message = localize('k_saved_ex'),
          saved = 'ph_mr_bones',
          colour = G.C.RED
        }
      end
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 5, G.PROFILES[G.SETTINGS.profile].career_stats.c_losses } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'career_stat' and args.statname == 'c_losses' then
      return G.PROFILES[G.SETTINGS.profile].career_stats[args.statname] >= 5
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('acrobat', {
  name = "Acrobat SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.hands_left == 0 then
      return {
        xmult = card.ability.extra.xmult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 200, G.PROFILES[G.SETTINGS.profile].career_stats.c_hands_played } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'career_stat' and args.statname == 'c_hands_played' then
      return G.PROFILES[G.SETTINGS.profile].career_stats[args.statname] >= 200
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('sock_and_buskin', {
  name = "Sock and Buskin SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, repetitions = 1 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_time_plural") } or { localize("k_time_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.other_card:is_face() then
      return {
        repetitions = card.ability.extra.repetitions * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 300, G.PROFILES[G.SETTINGS.profile].career_stats.c_face_cards_played } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'career_stat' and args.statname == 'c_face_cards_played' then
      return G.PROFILES[G.SETTINGS.profile].career_stats[args.statname] >= 300
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('swashbuckler', {
  name = "Swashbuckler SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 1 } },
  loc_vars = function(self, info_queue, card)
    local sell_cost = 0
    for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
      if joker ~= card then
        sell_cost = sell_cost + joker.sell_cost
      end
    end
    return {
      vars = {
        card.ability.extra.mult * sell_cost * card.ability.extra.current_factor,
        "(" .. localize("k_multiplied_by") .. " ",
        card.ability.extra.current_factor,
        ")"
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      local sell_cost = 0
      for _, joker in ipairs(G.jokers.cards) do
        if joker ~= card then
          sell_cost = sell_cost + joker.sell_cost
        end
      end
      return {
        mult = card.ability.extra.mult * sell_cost * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 20, G.PROFILES[G.SETTINGS.profile].career_stats.c_jokers_sold } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'career_stat' and args.statname == 'c_jokers_sold' then
      return G.PROFILES[G.SETTINGS.profile].career_stats[args.statname] >= 20
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('troubadour', {
  name = "Troubadour SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, h_size = 2, h_plays = -1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.h_size * card.ability.extra.current_factor, -card.ability.extra.h_plays } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      G.hand:change_size(card.ability.extra.h_size * card.ability.extra.delta_factor)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_plays
    G.hand:change_size(card.ability.extra.h_size * card.ability.extra.current_factor)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_plays
    G.hand:change_size(-(card.ability.extra.h_size * card.ability.extra.current_factor))
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 5 } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'round_win' then
      return G.PROFILES[G.SETTINGS.profile].career_stats.c_single_hand_round_streak >= 5
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('certificate', {
  name = "Certificate SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_card_plural") } or { localize("k_card_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.first_hand_drawn then
      for i = 1, card.ability.extra.current_factor do
        local _card = SMODS.create_card { set = "Base", seal = SMODS.poll_seal({ guaranteed = true, type_key = 'sns_certificate_seal' }), area = G.discard }
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        _card.playing_card = G.playing_card
        table.insert(G.playing_cards, _card)

        G.E_MANAGER:add_event(Event({
          func = function()
            G.hand:emplace(_card)
            _card:start_materialize()
            G.GAME.blind:debuff_card(_card)
            G.hand:sort()
            if context.blueprint_card then
              context.blueprint_card:juice_up()
            else
              card:juice_up()
            end
            SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
            save_run()
            return true
          end
        }))
      end

      return nil, true
    end
  end,
  check_for_unlock = function(self, args)
    return args.type == 'double_gold'
  end
}, true)

SMODS.Joker:take_ownership('smeared', {
  name = "Smeared Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 3, localize { type = 'name_text', key = 'm_wild', set = 'Enhanced' } } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, playing_card in ipairs(G.playing_cards or {}) do
        if SMODS.has_enhancement(playing_card, 'm_wild') then count = count + 1 end
        if count >= 3 then
          return true
        end
      end
    end
    return false
  end
}, true)

local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
  local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
  if not ret and not SMODS.has_no_suit(self) and next(SMODS.find_card("j_smeared")) then
    return SMODS.smeared_check(self, suit)
  end
  return ret
end

SMODS.Joker:take_ownership('throwback', {
  name = "Throwback SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 0.25 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor, 1 + G.GAME.skips * card.ability.extra.xmult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.skip_blind and not context.blueprint then
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { 1 + G.GAME.skips * card.ability.extra.xmult * card.ability.extra.current_factor } }
      }
    end
    if context.joker_main then
      return {
        xmult = 1 + G.GAME.skips * card.ability.extra.xmult * card.ability.extra.current_factor
      }
    end
  end,
  check_for_unlock = function(self, args)
    return args.type == 'continue_game'
  end
}, true)

SMODS.Joker:take_ownership('hanging_chad', {
  name = "Hanging Chad SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, repetitions = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.repetitions * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
      return {
        repetitions = card.ability.extra.repetitions * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('High Card', 'poker_hands') } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'round_win' then
      return G.GAME.last_hand_played == 'High Card' and G.GAME.blind.boss
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('rough_gem', {
  name = "Rough Gem SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
      G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) +
          (card.ability.extra.dollars * card.ability.extra.current_factor)
      return {
        dollars = card.ability.extra.dollars * card.ability.extra.current_factor,
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.GAME.dollar_buffer = 0
              return true
            end
          }))
        end
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 30, localize('Diamonds', 'suits_singular') } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, playing_card in ipairs(G.playing_cards or {}) do
        if playing_card.base.suit == "Diamonds" then count = count + 1 end
        if count >= 30 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('bloodstone', {
  name = "Bloodstone SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, odds = 2, Xmult = 1.5 } },
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'sns_bloodstone')

    return {
      vars = {
        numerator,
        denominator,
        card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and
        SMODS.pseudorandom_probability(card, 'sns_bloodstone', 1, card.ability.extra.odds) then
      return {
        xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 30, localize('Hearts', 'suits_singular') } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, playing_card in ipairs(G.playing_cards or {}) do
        if playing_card.base.suit == "Hearts" then count = count + 1 end
        if count >= 30 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('arrowhead', {
  name = "Arrowhead SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 50 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
      return {
        chips = card.ability.extra.chips * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 30, localize('Spades', 'suits_singular') } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, playing_card in ipairs(G.playing_cards or {}) do
        if playing_card.base.suit == "Spades" then count = count + 1 end
        if count >= 30 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('onyx_agate', {
  name = "Onyx Agate SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 7 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 30, localize('Clubs', 'suits_singular') } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, playing_card in ipairs(G.playing_cards or {}) do
        if playing_card.base.suit == "Clubs" then count = count + 1 end
        if count >= 30 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('glass', {
  name = "Glass Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult_gain = 0.75, Xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    if not card.debuff then
      info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
    end

    return { vars = { card.ability.extra.Xmult_gain * card.ability.extra.current_factor, card.ability.extra.Xmult } }
  end,
  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      local glass_cards = 0
      for _, removed_card in ipairs(context.removed) do
        if removed_card.shattered then glass_cards = glass_cards + 1 end
      end
      if glass_cards > 0 then
        G.E_MANAGER:add_event(Event({
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                card.ability.extra.Xmult = card.ability.extra.Xmult +
                    (card.ability.extra.Xmult_gain * glass_cards * card.ability.extra.current_factor)
                return true
              end
            }))
            SMODS.calculate_effect(
              {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult +
                (card.ability.extra.Xmult_gain * glass_cards * card.ability.extra.current_factor) } }
              }, card)
            return true
          end
        }))
        return nil, true
      end
    end
    if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == 'c_hanged_man' then
      local glass_cards = 0
      for _, removed_card in ipairs(G.hand.highlighted) do
        if SMODS.has_enhancement(removed_card, 'm_glass') then glass_cards = glass_cards + 1 end
      end
      if glass_cards > 0 then
        card.ability.extra.Xmult = card.ability.extra.Xmult +
            (card.ability.extra.Xmult_gain * glass_cards * card.ability.extra.current_factor)
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
        }
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.Xmult
      }
    end
  end,
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_glass') then
        return true
      end
    end
    return false
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 5, localize { type = 'name_text', key = 'm_glass', set = 'Enhanced' } } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, playing_card in ipairs(G.playing_cards or {}) do
        if SMODS.has_enhancement(playing_card, 'm_glass') then count = count + 1 end
        if count >= 5 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('ring_master', {
  name = "Showman SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 4 } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'ante_up' and args.ante == 4
  end
}, true)

local smods_showman_ref = SMODS.showman
function SMODS.showman(card_key)
  if next(SMODS.find_card('j_ring_master')) then
    return true
  end
  return smods_showman_ref(card_key)
end

SMODS.Joker:take_ownership('flower_pot', {
  name = "Flower Pot SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      local suits = {
        ['Hearts'] = 0,
        ['Diamonds'] = 0,
        ['Spades'] = 0,
        ['Clubs'] = 0
      }
      for i = 1, #context.scoring_hand do
        if not SMODS.has_any_suit(context.scoring_hand[i]) then
          if context.scoring_hand[i]:is_suit('Hearts', true) and suits["Hearts"] == 0 then
            suits["Hearts"] = suits["Hearts"] + 1
          elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0 then
            suits["Diamonds"] = suits["Diamonds"] + 1
          elseif context.scoring_hand[i]:is_suit('Spades', true) and suits["Spades"] == 0 then
            suits["Spades"] = suits["Spades"] + 1
          elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits["Clubs"] == 0 then
            suits["Clubs"] = suits["Clubs"] + 1
          end
        end
      end
      for i = 1, #context.scoring_hand do
        if SMODS.has_any_suit(context.scoring_hand[i]) then
          if context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then
            suits["Hearts"] = suits["Hearts"] + 1
          elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0 then
            suits["Diamonds"] = suits["Diamonds"] + 1
          elseif context.scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0 then
            suits["Spades"] = suits["Spades"] + 1
          elseif context.scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0 then
            suits["Clubs"] = suits["Clubs"] + 1
          end
        end
      end
      if suits["Hearts"] > 0 and
          suits["Diamonds"] > 0 and
          suits["Spades"] > 0 and
          suits["Clubs"] > 0 then
        return {
          xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
        }
      end
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 8 } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'ante_up' and args.ante == 8
  end
}, true)

SMODS.Joker:take_ownership('blueprint', {
  name = "Blueprint SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  loc_vars = function(self, info_queue, card)
    if card.area and card.area == G.jokers then
      local other_joker
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
      end
      local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
      main_end = {
        {
          n = G.UIT.C,
          config = { align = "bm", minh = 0.4 },
          nodes = {
            {
              n = G.UIT.C,
              config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
              nodes = {
                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
              }
            }
          }
        }
      }
      return { main_end = main_end }
    end
  end,
  calculate = function(self, card, context)
    local other_joker = nil
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
    end
    return SMODS.blueprint_effect(card, other_joker, context)
  end,
  check_for_unlock = function(self, args)
    return args.type == 'win_custom'
  end
}, true)

SMODS.Joker:take_ownership('wee', {
  name = "Wee Joker SNS",
  display_size = { w = 71 * 0.7, h = 95 * 0.7 },
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, chips = 0, chip_mod = 8 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 and not context.blueprint then
      card.ability.extra.chips = card.ability.extra.chips +
          (card.ability.extra.chip_mod * card.ability.extra.current_factor)

      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.CHIPS,
        message_card = card
      }
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 18 } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'win' and 18 >= G.GAME.round
  end
}, true)

SMODS.Joker:take_ownership('merry_andy', {
  name = "Merry Andy SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, d_size = 3, h_size = -1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.d_size * card.ability.extra.current_factor, card.ability.extra.h_size } }
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      G.GAME.round_resets.discards = G.GAME.round_resets.discards +
          (card.ability.extra.d_size * card.ability.extra.delta_factor)
      ease_discard(card.ability.extra.d_size * card.ability.extra.delta_factor)
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards +
        (card.ability.extra.d_size * card.ability.extra.current_factor)

    if not card.ability.sns_delayed then
      ease_discard(card.ability.extra.d_size * card.ability.extra.current_factor)
    end

    G.hand:change_size(card.ability.extra.h_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards -
        (card.ability.extra.d_size * card.ability.extra.current_factor)

    if not card.ability.sns_delayed then
      ease_discard(-(card.ability.extra.d_size * card.ability.extra.current_factor))
    end

    G.hand:change_size(-card.ability.extra.h_size)
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 12 } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'win' and 12 >= G.GAME.round
  end
}, true)

SMODS.Joker:take_ownership('oops', {
  -- name = "Oops! All 6s SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor * 2
      }
    }
  end,
  calculate = function(self, card, context)
    if context.mod_probability and not context.blueprint then
      return {
        numerator = context.numerator * 2 * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { number_format(10000) } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'chip_score' and args.chips >= 10000
  end
}, true)

SMODS.Joker:take_ownership('idol', {
  name = "The Idol SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 2 } },
  loc_vars = function(self, info_queue, card)
    local idol_card = G.GAME.current_round.sns_idol_card or { rank = 'Ace', suit = 'Spades' }
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor, localize(idol_card.rank, 'ranks'), localize(idol_card.suit, 'suits_plural'), colours = { G.C.SUITS[idol_card.suit] } } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        context.other_card:get_id() == G.GAME.current_round.sns_idol_card.id and
        context.other_card:is_suit(G.GAME.current_round.sns_idol_card.suit) then
      return {
        xmult = card.ability.extra.xmult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { number_format(1000000) } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'chip_score' and args.chips >= 1000000
  end
}, true)

local function reset_sns_idol_card()
  G.GAME.current_round.sns_idol_card = { rank = 'Ace', suit = 'Spades' }
  local valid_idol_cards = {}
  for _, playing_card in ipairs(G.playing_cards) do
    if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
      valid_idol_cards[#valid_idol_cards + 1] = playing_card
    end
  end
  local idol_card = pseudorandom_element(valid_idol_cards, 'sns_idol' .. G.GAME.round_resets.ante)
  if idol_card then
    G.GAME.current_round.sns_idol_card.rank = idol_card.base.value
    G.GAME.current_round.sns_idol_card.suit = idol_card.base.suit
    G.GAME.current_round.sns_idol_card.id = idol_card.base.id
  end
end

SMODS.Joker:take_ownership('seeing_double', {
  name = "Seeing Double SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and SMODS.seeing_double_check(context.scoring_hand, 'Clubs') then
      return {
        xmult = card.ability.extra.xmult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize("ph_4_7_of_clubs") } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'hand_contents' then
      local tally = 0
      for i = 1, #args.cards do
        if args.cards[i]:get_id() == 7 and args.cards[i]:is_suit('Clubs') then
          tally = tally + 1
        end
        if tally >= 4 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('matador', {
  name = "Matador SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 8 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.debuffed_hand or context.joker_main then
      if G.GAME.blind.triggered then
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) +
            (card.ability.extra.dollars * card.ability.extra.current_factor)
        return {
          dollars = card.ability.extra.dollars * card.ability.extra.current_factor,
          func = function()
            G.E_MANAGER:add_event(Event({
              func = function()
                G.GAME.dollar_buffer = 0
                return true
              end
            }))
          end
        }
      end
    end
  end,
  check_for_unlock = function(self, args)
    return args.type == 'round_win' and G.GAME.current_round.hands_played == 1 and
        G.GAME.current_round.discards_left == G.GAME.round_resets.discards and
        G.GAME.blind.boss
  end
}, true)

SMODS.Joker:take_ownership('hit_the_road', {
  name = "Hit the Road SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult_gain = 0.5, xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_gain * card.ability.extra.current_factor, card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.discard and not context.blueprint and
        not context.other_card.debuff and
        context.other_card:get_id() == 11 then
      card.ability.extra.xmult = card.ability.extra.xmult +
          (card.ability.extra.xmult_gain * card.ability.extra.current_factor)
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
        colour = G.C.RED
      }
    end
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      card.ability.extra.xmult = 1
      return {
        message = localize('k_reset'),
        colour = G.C.RED
      }
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
  check_for_unlock = function(self, args)
    if args.type == 'discard_custom' then
      local tally = 0
      for i = 1, #args.cards do
        if args.cards[i]:get_id() == 11 then
          tally = tally + 1
        end
        if tally >= 5 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('duo', {
  name = "The Duo SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult = 2, type = 'Pair' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Pair', 'poker_hands') } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'win_no_hand' and G.GAME.hands['Pair'].played == 0
  end
}, true)

SMODS.Joker:take_ownership('trio', {
  name = "The Trio SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult = 3, type = 'Three of a Kind' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Three of a Kind', 'poker_hands') } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'win_no_hand' and G.GAME.hands['Three of a Kind'].played == 0
  end
}, true)

SMODS.Joker:take_ownership('family', {
  name = "The Family SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult = 4, type = 'Four of a Kind' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Four of a Kind', 'poker_hands') } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'win_no_hand' and G.GAME.hands['Four of a Kind'].played == 0
  end
}, true)

SMODS.Joker:take_ownership('order', {
  name = "The Order SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult = 3, type = 'Straight' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Straight', 'poker_hands') } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'win_no_hand' and G.GAME.hands['Straight'].played == 0
  end
}, true)

SMODS.Joker:take_ownership('tribe', {
  name = "The Tribe SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, Xmult = 2, type = 'Flush' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult * card.ability.extra.current_factor, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        xmult = card.ability.extra.Xmult * card.ability.extra.current_factor
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { localize('Flush', 'poker_hands') } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'win_no_hand' and G.GAME.hands['Flush'].played == 0
  end
}, true)

SMODS.Joker:take_ownership('stuntman', {
  name = "Stuntman SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, h_size = 2, chip_mod = 250 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chip_mod * card.ability.extra.current_factor, card.ability.extra.h_size } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.chip_mod * card.ability.extra.current_factor
      }
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.h_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.h_size)
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { number_format(100000000) } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'chip_score' and args.chips >= 100000000
  end
}, true)

SMODS.Joker:take_ownership('invisible', {
  name = "Invisible Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  draw = function(self, card, layer)
    if card.config.center.discovered or card.bypass_discovery_center then
      card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
    end
  end,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, invis_rounds = 0, total_rounds = 2 } },
  loc_vars = function(self, info_queue, card)
    local main_end
    if G.jokers and G.jokers.cards then
      for _, joker in ipairs(G.jokers.cards) do
        if joker.edition and joker.edition.negative then
          main_end = {}
          localize { type = 'other', key = 'remove_negative', nodes = main_end, vars = {} }
          main_end = main_end[1]
          break
        end
      end
    end
    return {
      vars = {
        card.ability.extra.total_rounds,
        card.ability.extra.invis_rounds,
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_joker_plural") } or { localize("k_joker_singular") })
            [1]
      },
      main_end = main_end
    }
  end,
  calculate = function(self, card, context)
    if context.selling_self and (card.ability.extra.invis_rounds >= card.ability.extra.total_rounds) and not context.blueprint then
      local jokers = {}
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] ~= card then
          jokers[#jokers + 1] = G.jokers.cards[i]
        end
      end
      if #jokers > 0 then
        for i = 1, card.ability.extra.current_factor do
          if #G.jokers.cards <= G.jokers.config.card_limit then
            local chosen_joker = pseudorandom_element(jokers, 'sns_invisible_' .. i)
            local chosen_joker_has_normal_negative = chosen_joker and chosen_joker.edition and chosen_joker.edition.negative
              and not ((chosen_joker.ability and chosen_joker.ability.eternal and chosen_joker.ability.perishable)
                or (chosen_joker.ability and chosen_joker.ability.eternal and chosen_joker.debuff
                  and (chosen_joker.ability.debuff_sources and chosen_joker.ability.debuff_sources['toxic'])
                )
              )
            local copied_joker = copy_card(chosen_joker, nil, nil, nil, chosen_joker_has_normal_negative)
            copied_joker:add_to_deck()
            G.jokers:emplace(copied_joker)
          else
            --[[
                        It's difficult to think of an edge case where this could possibly ever happen
                        (some kind of Joker CardArea manipulation while the selling is in progress AND a card hasn't been duplicated yet).
                        In addition, it doesn't make sense to say that's there no room anymore
                        if at least one card managed to be duplicated.
                        Therefore, we commend this out.
                        return { message = localize('k_no_room_ex') }
                        ]]
          end
        end

        return { message = localize('k_duplicated_ex') }
      else
        return { message = localize('k_no_other_jokers') }
      end
    end
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      card.ability.extra.invis_rounds = card.ability.extra.invis_rounds + 1
      if card.ability.extra.invis_rounds == card.ability.extra.total_rounds then
        local eval = function(card) return not card.REMOVED end
        juice_card_until(card, eval, true)
      end
      return {
        message = (card.ability.extra.invis_rounds < card.ability.extra.total_rounds) and
            (card.ability.extra.invis_rounds .. '/' .. card.ability.extra.total_rounds) or
            localize('k_active_ex'),
        colour = G.C.FILTER
      }
    end
  end,
  check_for_unlock = function(self, args)
    return args.type == 'win_custom' and G.GAME.max_jokers <= 4
  end,
}, true)

SMODS.Joker:take_ownership('brainstorm', {
  name = "Brainstorm SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  loc_vars = function(self, info_queue, card)
    if card.area and card.area == G.jokers then
      local compatible = G.jokers.cards[1] and G.jokers.cards[1] ~= card and
          G.jokers.cards[1].config.center.blueprint_compat
      main_end = {
        {
          n = G.UIT.C,
          config = { align = "bm", minh = 0.4 },
          nodes = {
            {
              n = G.UIT.C,
              config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
              nodes = {
                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
              }
            }
          }
        }
      }
      return { main_end = main_end }
    end
  end,
  calculate = function(self, card, context)
    local ret = SMODS.blueprint_effect(card, G.jokers.cards[1], context)
    if ret then
      ret.colour = G.C.RED
    end
    return ret
  end,
  check_for_unlock = function(self, args)
    if args.type == 'discard_custom' then
      local eval = evaluate_poker_hand(args.cards)
      if next(eval['Straight Flush']) then
        local min = 10
        for j = 1, #args.cards do
          if args.cards[j]:get_id() < min then min = args.cards[j]:get_id() end
        end
        if min == 10 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('satellite', {
  name = "Satellite SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, dollars = 1 } },
  loc_vars = function(self, info_queue, card)
    local planets_used = 0
    for k, v in pairs(G.GAME.consumeable_usage) do if v.set == 'Planet' then planets_used = planets_used + 1 end end
    return { vars = { card.ability.extra.dollars * card.ability.extra.current_factor, planets_used * card.ability.extra.dollars * card.ability.extra.current_factor } }
  end,
  calc_dollar_bonus = function(self, card)
    local planets_used = 0
    for k, v in pairs(G.GAME.consumeable_usage) do
      if v.set == 'Planet' then planets_used = planets_used + 1 end
    end
    return planets_used > 0 and planets_used * card.ability.extra.dollars * card.ability.extra.current_factor or nil
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 400 } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'money' and G.GAME.dollars >= 400
  end
}, true)

SMODS.Joker:take_ownership('shoot_the_moon', {
  name = "Shoot the Moon SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 13 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 12 then
      if context.other_card.debuff then
        return {
          message = localize('k_debuffed'),
          colour = G.C.RED
        }
      else
        return {
          mult = card.ability.extra.mult * card.ability.extra.current_factor
        }
      end
    end
  end,
  check_for_unlock = function(self, args)
    if args.type == 'play_all_hearts' then
      for _, card in ipairs(G.deck.cards) do
        if not SMODS.has_no_suit(card) and card.base.suit == 'Hearts' then
          return false
        end
      end
      for _, card in ipairs(G.hand.cards) do
        if not SMODS.has_no_suit(card) and card.base.suit == 'Hearts' then
          return false
        end
      end
      return true
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('drivers_license', {
  name = "Driver's License SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, xmult = 3, driver_amount = 16 } },
  loc_vars = function(self, info_queue, card)
    local driver_tally = 0
    for _, playing_card in pairs(G.playing_cards or {}) do
      if next(SMODS.get_enhancements(playing_card)) then driver_tally = driver_tally + 1 end
    end
    return { vars = { card.ability.extra.xmult * card.ability.extra.current_factor, card.ability.extra.driver_amount, driver_tally } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      local driver_tally = 0
      for _, playing_card in pairs(G.playing_cards) do
        if next(SMODS.get_enhancements(playing_card)) then driver_tally = driver_tally + 1 end
      end
      if driver_tally >= card.ability.extra.driver_amount then
        return {
          xmult = card.ability.extra.xmult * card.ability.extra.current_factor
        }
      end
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 16 } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_deck' then
      local count = 0
      for _, playing_card in ipairs(G.playing_cards or {}) do
        if playing_card.ability.set == 'Enhanced' then count = count + 1 end
        if count >= 16 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('cartomancer', {
  name = "Cartomancer SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_card_plural") } or { localize("k_card_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + card.ability.extra.current_factor

      for i = 1, card.ability.extra.current_factor do
        G.E_MANAGER:add_event(Event({
          func = (function()
            G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.add_card {
                  set = 'Tarot',
                  key_append = 'sns_cartomancer'
                }
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                return true
              end
            }))

            SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
              context.blueprint_card or card)
            return true
          end)
        }))
      end

      return nil, true
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 22 } }
  end,
  check_for_unlock = function(self, args)
    return args.type == 'discover_amount' and #G.P_CENTER_POOLS.Tarot <= args.tarot_count
  end
}, true)

SMODS.Joker:take_ownership('astronomer', {
  name = "Astronomer SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = false,
  sns_toxic_compat = true,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  add_to_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        for k, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        for k, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end,
  check_for_unlock = function(self, args)
    return args.type == 'discover_amount' and #G.P_CENTER_POOLS.Planet <= args.planet_count
  end
}, true)

local card_set_cost_ref = Card.set_cost
function Card:set_cost()
  card_set_cost_ref(self)
  if next(SMODS.find_card("j_astronomer")) then
    if (self.ability.set == 'Planet' or (self.ability.set == 'Booster' and self.config.center.kind == 'Celestial')) then self.cost = 0 end
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
  end
end

SMODS.Joker:take_ownership('burnt', {
  name = "Burnt Joker SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0 } },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.current_factor,
        (card.ability.extra.current_factor > 1 and { localize("k_time_plural") } or { localize("k_time_singular") })
            [1]
      }
    }
  end,
  calculate = function(self, card, context)
    if context.pre_discard and G.GAME.current_round.discards_used <= 0 and not context.hook then
      local text, _ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
      return {
        level_up = card.ability.extra.current_factor,
        level_up_hand = text
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 50, G.PROFILES[G.SETTINGS.profile].career_stats.c_cards_sold } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'career_stat' and args.statname == 'c_cards_sold' then
      return G.PROFILES[G.SETTINGS.profile].career_stats[args.statname] >= 50
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('bootstraps', {
  name = "Bootstraps SNS",
  sns_rental_compat = true,
  sns_magnet_compat = true,
  sns_delayed_compat = true,
  sns_toxic_compat = true,
  sns_supercritical_compat = true,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, supercritical_stage = 0, mult = 2, dollars = 5 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult * card.ability.extra.current_factor, card.ability.extra.dollars, card.ability.extra.mult * card.ability.extra.current_factor * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars) } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = card.ability.extra.mult * card.ability.extra.current_factor *
            math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
      }
    end
  end,
  locked_loc_vars = function(self, info_queue, card)
    return { vars = { 2 } }
  end,
  check_for_unlock = function(self, args)
    if args.type == 'modify_jokers' and G.jokers then
      local count = 0
      for _, joker in ipairs(G.jokers.cards) do
        if joker.ability.set == 'Joker' and joker.edition and joker.edition.polychrome then
          count = count + 1
        end
        if count >= 2 then
          return true
        end
      end
    end
    return false
  end
}, true)

SMODS.Joker:take_ownership('caino', {
  name = "Caino SNS",
  sns_rental_compat = false,
  sns_magnet_compat = false,
  sns_delayed_compat = false,
  sns_toxic_compat = false,
  sns_supercritical_compat = false,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, xmult = 1, xmult_gain = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      local face_cards = 0
      for _, removed_card in ipairs(context.removed) do
        if removed_card:is_face() then face_cards = face_cards + 1 end
      end
      if face_cards > 0 then
        card.ability.extra.xmult = card.ability.extra.xmult + face_cards * card.ability.extra.xmult_gain
        return { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } } }
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('triboulet', {
  name = "Triboulet SNS",
  sns_rental_compat = false,
  sns_magnet_compat = false,
  sns_delayed_compat = false,
  sns_toxic_compat = false,
  sns_supercritical_compat = false,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, xmult = 2 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and
        (context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('yorick', {
  name = "Yorick SNS",
  sns_rental_compat = false,
  sns_magnet_compat = false,
  sns_delayed_compat = false,
  sns_toxic_compat = false,
  sns_supercritical_compat = false,
  config = { extra = { current_factor = 1, original_factor = 1, delta_factor = 0, toxic_stack = 0, xmult = 1, xmult_gain = 1, discards = 23, discards_remaining = 23 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_gain, card.ability.extra.discards, card.ability.extra.discards_remaining, card.ability.extra.xmult } }
  end,
  calculate = function(self, card, context)
    if context.discard and not context.blueprint then
      if card.ability.extra.discards_remaining <= 1 then
        card.ability.extra.discards_remaining = card.ability.extra.discards
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
          colour = G.C.RED
        }
      else
        card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
        return nil, true
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
}, true)

SMODS.Joker:take_ownership('chicot', {
  name = "Chicot SNS",
  sns_rental_compat = false,
  sns_magnet_compat = false,
  sns_delayed_compat = false,
  sns_toxic_compat = false,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint and context.blind.boss then
      G.E_MANAGER:add_event(Event({
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.GAME.blind:disable()
              play_sound('timpani')
              delay(0.4)
              return true
            end
          }))
          SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
          return true
        end
      }))
      return nil, true
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
      G.GAME.blind:disable()
      play_sound('timpani')
      SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
    end
  end
}, true)

SMODS.Joker:take_ownership('perkeo', {
  name = "Perkeo SNS",
  sns_rental_compat = false,
  sns_magnet_compat = false,
  sns_delayed_compat = false,
  sns_toxic_compat = false,
  sns_supercritical_compat = false,
  config = { extra = { toxic_stack = 0 } },
  loc_vars = function(self, info_queue, card)
    if not card.debuff then
      info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    end
  end,
  calculate = function(self, card, context)
    if context.ending_shop and G.consumeables.cards[1] then
      G.E_MANAGER:add_event(Event({
        func = function()
          local card_to_copy, _ = pseudorandom_element(G.consumeables.cards, 'sns_perkeo')
          local copied_card = copy_card(card_to_copy)
          copied_card:set_edition("e_negative", true)
          copied_card:add_to_deck()
          G.consumeables:emplace(copied_card)
          return true
        end
      }))
      return { message = localize('k_duplicated_ex') }
    end
  end,
}, true)

function SMODS.current_mod.reset_game_globals(run_start)
  reset_sns_mail_rank()
  reset_sns_ancient_card()
  reset_sns_castle_card()
  reset_sns_idol_card()
end
