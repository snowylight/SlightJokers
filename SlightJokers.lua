SMODS.Atlas{
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
}

SMODS.Atlas{
    key = "j_blue_card",
    path = "j_blue_card.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_century_egg",
    path = "j_century_egg.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_chinese_chef",
    path = "j_chinese_chef.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_evil_astronaut",
    path = "j_evil_astronaut.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_exiled_joker",
    path = "j_exiled_joker.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_lava_erupt",
    path = "j_lava_erupt.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_pe_student",
    path = "j_pe_student.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_polar_climber",
    path = "j_polar_climber.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_sam_club",
    path = "j_sam_club.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_world_end",
    path = "j_world_end.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_ignis_fatuus",
    path = "j_ignis_fatuus.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_minotaur",
    path = "j_minotaur.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_mysterious_nebula",
    path = "j_mysterious_nebula.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_old_phone",
    path = "j_old_phone.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_rice_dumpling",
    path = "j_rice_dumpling.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_square_family",
    path = "j_square_family.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_great_moment",
    path = "j_great_moment.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_private_bank",
    path = "j_private_bank.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_cloistered_joker",
    path = "j_cloistered_joker.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "j_lightning_summit",
    path = "j_lightning_summit.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'blue_card',
    atlas = 'j_blue_card',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    eternal_compat = true,
    config = { extra = { increase = 12, chips = 0 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.increase, card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.skipping_booster and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.increase
            G.E_MANAGER:add_event(Event({
            func = function() 
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.increase}},
                    colour = G.C.BLUE,
                    delay = 0.45, 
                    card = card
                }) 
                return true
            end}))
            return nil, true
        end
        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.chips > 0 then
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
        end
    end
}

SMODS.Joker {
    key = 'century_egg',
    atlas = 'j_century_egg',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { slot = 1 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.slot } }
    end,
    calculate = function(self, card, context)
    end,
    add_to_deck = function(self, card, context)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slot
    end,
    remove_from_deck = function(self, card, context)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slot
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.sell_cost
        if bonus > 0 then return bonus end
    end,
}

SMODS.Joker {
    key = 'chinese_chef',
    atlas = 'j_chinese_chef',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_slightjokers_century_egg
        info_queue[#info_queue + 1] = G.P_CENTERS.j_slightjokers_rice_dumpling
        info_queue[#info_queue+1] = {key = 'slightjokers_ramen', set = 'Other'}
        info_queue[#info_queue + 1] = G.P_CENTERS.j_turtle_bean
    return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.ending_shop and not context.blueprint_card and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            local food_list = {
                    "j_slightjokers_century_egg",
                    "j_ramen",
                    "j_turtle_bean",
                    "j_slightjokers_rice_dumpling",
                }
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function() 
                    for i = 1, jokers_to_create do
                        local element_joker = pseudorandom_element(food_list, pseudoseed('chinesechef'))
                        local card = create_card('Joker', G.jokers, nil, 0, nil, nil, element_joker, nil)
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end}))   
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE}) 
            return nil, true
        end
    end,
}

SMODS.Joker {
    key = 'evil_astronaut',
    atlas = 'j_evil_astronaut',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { odds = 3 } },
    loc_vars = function(self, info_queue, card)
    return { vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds} }
    end,
    calculate = function(self, card, context)
        if context.before then
            if not context.blueprint_card then
                G.GAME.hands[G.GAME.last_hand_played].played = G.GAME.hands[G.GAME.last_hand_played].played + 1
            end
            if pseudorandom('evilastronaut') < (G.GAME and G.GAME.probabilities.normal or 1)/card.ability.extra.odds then
                return {
                    card = card,
                    level_up = true,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end,
}

SMODS.Joker {
    key = 'exiled_joker',
    atlas = 'j_exiled_joker',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { xmult = 1 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.playing_card_added and not card.getting_sliced then
            if not context.blueprint and context.cards and context.cards[1] then
                for k, v in pairs(context.cards) do
                    v.ability.perma_x_mult = v.ability.perma_x_mult or 0
                    v.ability.perma_x_mult = v.ability.perma_x_mult + card.ability.extra.xmult
                end
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.x_mult}}, colour = G.C.RED})
            end
        end
    end,
}

SMODS.Joker {
    key = 'lava_erupt',
    atlas = 'j_lava_erupt',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for k, v in ipairs(context.full_hand) do
                local found_in_scoring = false
                for k, t in ipairs(context.scoring_hand) do
                    if v == t then
                    found_in_scoring = true
                    break
                    end
                end
                if not found_in_scoring and not v.debuff then
                    if next(SMODS.get_enhancements(v)) then
                        v.lavaerupt = v.config.center.key
                    else
                        v.lavaeruptbase = true
                    end
                    v:set_ability(G.P_CENTERS.m_stone, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    })) 
                    table.insert(context.scoring_hand, v)
                    highlight_card(v,3/5,'up')
                    card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize('slightjokers_erupt_solidify'), colour = G.C.RED})
                end
            end
        end
        if context.final_scoring_step and not context.blueprint then
            for k, v in ipairs(context.full_hand) do
                if v.lavaerupt or v.lavaeruptbase then
                    if v.lavaerupt then
                        v:set_ability(G.P_CENTERS[v.lavaerupt], nil, true)
                    elseif v.lavaeruptbase then
                        v:set_ability(G.P_CENTERS.c_base, nil, true)
                    end
                    v.lavaerupt = nil
                    v.lavaeruptbase = nil
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    })) 
                end
            end
        end
    end,
}

SMODS.Joker {
    key = 'pe_student',
    atlas = 'j_pe_student',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    eternal_compat = true,
    config = { extra = { increase = 0.25, xchips = 1 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.increase, card.ability.extra.xchips } }
    end,
    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['Straight']) and not context.blueprint then
            card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.increase
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                card = card
            }
        end
        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.xchips > 1 then
            return {
                message = localize{type='variable',key='a_xchips',vars={card.ability.extra.xchips}},
                Xchip_mod = card.ability.extra.xchips
            }
        end
    end,
}

SMODS.Joker {
    key = 'polar_climber',
    atlas = 'j_polar_climber',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { xchips = 0.2 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xchips } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.end_of_round and not context.repetition and not context.other_card.debuff then
            context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips or 0
            context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips + card.ability.extra.xchips
            card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.BLUE})
        end
    end,
}

SMODS.Joker {
    key = 'sam_club',
    atlas = 'j_sam_club',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { slot = 3 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'slightjokers_inflation', set = 'Other'}
    return { vars = { card.ability.extra.slot } }
    end,
    calculate = function(self, card, context)
    end,
    add_to_deck = function(self, card, context)
        change_shop_size(card.ability.extra.slot)
        G.GAME.modifiers.inflation = true
        local ref_inflation = G.GAME.inflation or 0
    end,
    remove_from_deck = function(self, card, context)
        change_shop_size(-card.ability.extra.slot)
        if not next(SMODS.find_card("j_slightjokers_sam_club")) then
            G.GAME.modifiers.inflation = false
            G.GAME.inflation = ref_inflation or 0
            G.E_MANAGER:add_event(Event({func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
            return true end }))
        end
    end,
}

SMODS.Joker {
    key = 'world_end',
    atlas = 'j_world_end',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { chips = 50, mult = 10, xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.other_consumeable and context.other_consumeable.ability.set == 'Planet' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    context.other_consumeable:juice_up(0.5, 0.5)
                    return true
                end
            })) 
            return {
                message = localize{type='variable',key='slightjokers_worldend',vars={ card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult }},
                chip_mod = card.ability.extra.chips,
                mult_mod = card.ability.extra.mult,
                Xmult_mod = card.ability.extra.xmult
            }
        end
    end,
}

SMODS.Joker {
    key = 'ignis_fatuus',
    atlas = 'j_ignis_fatuus',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { increase = 0.25, xchips = 1 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.increase, card.ability.extra.xchips } }
    end,
    calculate = function(self, card, context)
        if context.buying_card and not context.blueprint then
            if context.card and context.card ~= card then
                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.increase
                G.E_MANAGER:add_event(Event({
                    func = function() card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')}); return true
                end}))
            end
        end
        if context.end_of_round and G.GAME.blind.boss and card.ability.extra.xchips ~= 1 and not context.blueprint then
            card.ability.extra.xchips = 1
            return {
                message = localize('k_reset'),
                colour = G.C.BLUE
            }
        end
        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.xchips > 1 then
            return {
                message = localize{type='variable',key='a_xchips',vars={card.ability.extra.xchips}},
                Xchip_mod = card.ability.extra.xchips
            }
        end
    end,
}

SMODS.Joker {
    key = 'minotaur',
    atlas = 'j_minotaur',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    eternal_compat = true,
    config = { extra = { increase = 45, chips = 0 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.increase, card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.increase
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.BLUE
            }
        end
        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.chips > 0 then
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
        end
    end,
}

SMODS.Joker {
    key = 'mysterious_nebula',
    atlas = 'j_mysterious_nebula',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
    return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                message = localize{type='variable',key='a_mult',vars={G.GAME.hands[context.scoring_name].played+G.GAME.hands[context.scoring_name].level}},
                mult_mod = G.GAME.hands[context.scoring_name].played + G.GAME.hands[context.scoring_name].level
            }
        end
    end,
}

SMODS.Joker {
    key = 'old_phone',
    atlas = 'j_old_phone',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
    return { vars = {localize(G.GAME.current_round.ancient_card.suit, 'suits_singular'),
                    localize(G.GAME.current_round.castle_card.suit, 'suits_singular'),
                    localize(G.GAME.current_round.idol_card.suit, 'suits_plural'),
                    localize(G.GAME.current_round.idol_card.rank, 'ranks'),
                    localize(G.GAME.current_round.mail_card.rank, 'ranks')}}
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:is_suit(G.GAME.current_round.ancient_card.suit) or 
                context.other_card:is_suit(G.GAME.current_round.castle_card.suit) or 
                context.other_card:is_suit(G.GAME.current_round.idol_card.suit) or
                context.other_card:get_id() == G.GAME.current_round.idol_card.id or
                context.other_card:get_id() == G.GAME.current_round.idol_card.id then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = 'rice_dumpling',
    atlas = 'j_rice_dumpling',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = false,
    config = { extra = { interest = 3, interestmod = 1 } },
    loc_vars = function(self, info_queue, card)
    return { vars = {card.ability.extra.interest, card.ability.extra.interestmod} }
    end,
    calculate = function(self, card, context)
        if context.starting_shop and not context.blueprint and card.ability.extra.interest - card.ability.extra.interestmod <= 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                        return true; end})) 
                return true
            end
            })) 
            return {
                card = card,
                message = localize('k_eaten_ex'),
                colour = G.C.FILTER
            }
        elseif context.starting_shop and not context.blueprint then
            card.ability.extra.interest = card.ability.extra.interest - card.ability.extra.interestmod
            return {
                message = localize{type='variable',key='slightjokers_ricedumpling',vars={card.ability.extra.interestmod}},
                colour = G.C.FILTER
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.extra.interest*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5)
        if bonus > 0 then return bonus end
    end,
}

SMODS.Joker {
    key = 'square_family',
    atlas = 'j_square_family',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { xchips = 1.6 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xchips }}
    end,
    set_sprites = function(self, card, front)
        card.children.center.scale.y = card.children.center.scale.x
        local W, H = card.T.w, card.T.h
        H = W
        card.T.h = H
    end,
    calculate = function(self, card, context)
        if context.open_booster and context.card.ability.name:find('Buffoon') and not context.blueprint then
            G.E_MANAGER:add_event(Event({func = function()
            for i = 1, #G.pack_cards.cards do
                if G.pack_cards.cards[i].ability.set == "Joker" and not (G.pack_cards.cards[i].config.center.soul_pos or G.pack_cards.cards[i].config.center.name == "Square Joker" or G.pack_cards.cards[i].config.center.name == "Half Joker" or G.pack_cards.cards[i].config.center.key == "j_slightjokers_square_family") then
                    card_eval_status_text(G.pack_cards.cards[i], "extra", nil, nil, nil, {message = localize('slightjokers_square'), colour = G.C.BLUE})
                    G.pack_cards.cards[i]:juice_up(0.5, 0.5)
                    G.pack_cards.cards[i].T.h = G.pack_cards.cards[i].T.w
                    G.pack_cards.cards[i].ability.slightjokers_square = true
                    break
                end
            end
            return true end}))
        end
        if context.other_joker then
            if context.other_joker.ability.slightjokers_square or context.other_joker.config.center.name == "Square Joker" or context.other_joker.config.center.key == "j_slightjokers_square_family" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    context.other_joker:juice_up(0.5, 0.5)
                    return true
                end
            })) 
            return {
                message = localize{type='variable',key='a_xchips',vars={card.ability.extra.xchips}},
                Xchip_mod = card.ability.extra.xchips,
            }
            end
        end
    end,
}

SMODS.Joker {
    key = 'great_moment',
    atlas = 'j_great_moment',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
    return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card and context.other_card == context.scoring_hand[1] then
            return {
                card = card,
                balance = true
            }
        end
    end,
}

SMODS.Joker {
    key = 'private_bank',
    atlas = 'j_private_bank',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { slot = 1 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.slot } }
    end,
    calculate = function(self, card, context)
    end,
    add_to_deck = function(self, card, context)
        change_shop_size(card.ability.extra.slot)
        SMODS.change_voucher_limit(card.ability.extra.slot)
        SMODS.change_booster_limit(card.ability.extra.slot)
    end,
    remove_from_deck = function(self, card, context)
        change_shop_size(-card.ability.extra.slot)
        SMODS.change_voucher_limit(-card.ability.extra.slot)
        SMODS.change_booster_limit(-card.ability.extra.slot)
    end,
}

SMODS.Joker {
    key = 'cloistered_joker',
    atlas = 'j_cloistered_joker',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    eternal_compat = true,
    config = { extra = { increase = 2, mult = 0 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.increase, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if G.pack_cards and context.using_consumeable and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.increase
            G.E_MANAGER:add_event(Event({
            func = function() 
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.increase}},
                    colour = G.C.RED,
                    delay = 0.45, 
                    card = card
                }) 
                return true
            end}))
            return nil, true
        end
        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.mult > 0 then
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                mult_mod = card.ability.extra.mult
            }
        end
    end,
}

SMODS.Joker {
    key = 'lightning_summit',
    atlas = 'j_lightning_summit',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    config = { extra = { mult = 9 } },
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and G.GAME.current_round.hands_left > 0 then
            return {
                message = localize{type='variable',key='a_mult',vars={G.GAME.current_round.hands_left*card.ability.extra.mult}},
                mult_mod = G.GAME.current_round.hands_left*card.ability.extra.mult
            }
        end
    end,
}

SMODS.Atlas{
    key = "b_curtain",
    path = "b_curtain.png",
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = "sleeve_curtain",
    path = "sleeve_curtain.png",
    px = 73,
    py = 95
}

SMODS.Back({
	key = "curtain", 
	atlas = "b_curtain",
	pos = {x = 0, y = 0},
	config = { vouchers = { "v_magic_trick" }},
    unlocked = true,
    calculate = function(self, back, context)
        if context.playing_card_added then
            if context.cards and context.cards[1] then
                for k, v in pairs(context.cards) do
                    local destroyed_cards = {}
                    v.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
					    func = function()
                            local curtain_bonus = v.base.nominal or 0

                            if SMODS.has_no_rank(v) then
                                curtain_bonus = 0
                            else
                                curtain_bonus = v.base.nominal
                            end
                                for k, t in pairs(G.playing_cards) do
                                    t.ability.bonus = t.ability.bonus or 0
                                    t.ability.bonus = t.ability.bonus + curtain_bonus
                                end
                            if G.deck and G.deck.cards[1] then
						        G.deck.cards[#G.deck.cards]:juice_up(0.8, 0.8)
                                card_eval_status_text(G.deck.cards[#G.deck.cards], 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {curtain_bonus}}, colour = G.C.BLUE})
                            end

                            if SMODS.shatters(v) then
                                local t = v
                                t.shattered = true
                                destroyed_cards[#destroyed_cards+1] = t
                                v:shatter()
                            else
                                destroyed_cards[#destroyed_cards+1] = v
						        v:start_dissolve({ G.C.BLUE }, nil, 1.6)
                            end

                            SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed_cards })

						    return true
					    end,
				    }))
                end
            end
        end
    end,
})

if next(SMODS.find_mod("CardSleeves")) and (SMODS.Mods['CardSleeves'] or {}).can_load then
CardSleeves.Sleeve {
    key = "curtain",
    atlas = "sleeve_curtain",
    pos = { x = 0, y = 0 },
    unlocked = true,
    loc_vars = function(self)
        local key
        if self.get_current_deck_key() ~= "b_slightjokers_curtain" then
            key = self.key
            self.config = { vouchers = { "v_magic_trick" } }
        else
            key = self.key .. "_alt"
            self.config = { vouchers = { "v_magic_trick", "v_illusion" } }
        end
        return { key = key, vars = {} }
    end,
    calculate = function(self, sleeve, context)
        if self.get_current_deck_key() ~= "b_slightjokers_curtain" then
        if context.playing_card_added then
            if context.cards and context.cards[1] then
                for k, v in pairs(context.cards) do
                    local destroyed_cards = {}
                    v.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
					    func = function()
                            local curtain_bonus = v.base.nominal or 0

                            if SMODS.has_no_rank(v) then
                                curtain_bonus = 0
                            else
                                curtain_bonus = v.base.nominal
                            end
                                for k, t in pairs(G.playing_cards) do
                                    t.ability.bonus = t.ability.bonus or 0
                                    t.ability.bonus = t.ability.bonus + curtain_bonus
                                end
                            if G.deck and G.deck.cards[1] then
						        G.deck.cards[#G.deck.cards]:juice_up(0.8, 0.8)
                                card_eval_status_text(G.deck.cards[#G.deck.cards], 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {curtain_bonus}}, colour = G.C.BLUE})
                            end

                            if SMODS.shatters(v) then
                                local t = v
                                t.shattered = true
                                destroyed_cards[#destroyed_cards+1] = t
                                v:shatter()
                            else
                                destroyed_cards[#destroyed_cards+1] = v
						        v:start_dissolve({ G.C.BLUE }, nil, 1.6)
                            end

                            SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed_cards })

						    return true
					    end,
				    }))
                end
            end
        end
        end
    end,
}
end

local slightjokers_card_load = Card.load
function Card:load(cardTable, other_card)
	local ret = slightjokers_card_load(self, cardTable, other_card)
    local scale = 1
    local H = G.CARD_H
    local W = G.CARD_W
    if self.ability.slightjokers_square then
        H = W
        self.T.h = H*scale
        self.T.w = W*scale
    end

	return ret
end

SMODS.Challenge:take_ownership('c_inflation_1', {
    restrictions = {
        banned_cards = {
            {id = 'j_slightjokers_sam_club'},
            {id = 'v_clearance_sale'},
            {id = 'v_liquidation'},
        },
        banned_tags = {},
        banned_other = {}
    },
})