
SMODS.Joker{ --The Swordmaster
    key = "theswordmaster",
    config = {
        extra = {
            odds = 5,
            blind_size0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'The Swordmaster',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to',
            [2] = 'halve boss blind it\'s Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = "ikepikeba_slugcat",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ikepikeba_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_ikepikeba_theswordmaster') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                if SMODS.pseudorandom_probability(card, 'group_0_96ab6724', 1, card.ability.extra.odds, 'j_ikepikeba_theswordmaster', false) then
                    SMODS.calculate_effect({
                        func = function()
                            if G.GAME.blind.in_blind then
                                
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "STAB!", colour = G.C.GREEN})
                                G.GAME.blind.chips = G.GAME.blind.chips / 2
                                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                G.HUD_blind:recalculate()
                                return true
                            end
                        end}, card)
                    end
                end
            end
        end
    }