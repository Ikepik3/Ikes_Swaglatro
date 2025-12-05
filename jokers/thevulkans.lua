
SMODS.Joker{ --The Vulkans
    key = "thevulkans",
    config = {
        extra = {
            currMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Vulkans',
        ['text'] = {
            [1] = '{C:red}^#1# mult{}',
            [2] = 'adds {C:red}^+0.05 mult{}',
            [3] = 'if a card is bought'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 35,
    rarity = "ikepikeba_slugcat",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.currMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                e_mult = card.ability.extra.currMult
            }
        end
        if context.buying_card  then
            return {
                func = function()
                    card.ability.extra.currMult = (card.ability.extra.currMult) + 0.05
                    return true
                end
            }
        end
    end
}