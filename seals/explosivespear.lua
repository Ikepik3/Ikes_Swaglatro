SMODS.Seal {
    key = 'explosivespear',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            retriggers = 2,
            odds = 4
        }
    },
    badge_colour = HEX('000000'),
    loc_txt = {
        name = 'Explosive spear',
        label = 'Explosive spear',
        text = {
            [1] = 'A {C:blue}custom{} seal with {C:red}unique{} effects.'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    
    calculate = function(self, card, context)
        if context.repetition then
            return {
                repetitions = card.ability.seal.extra.retriggers,
            }
        end

        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'vremade_glass', 1, card.ability.extra.odds) then
            card.glass_trigger = true -- SMODS addition
            return { remove = true }
        end
    end,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, 4, 'vremade_glass')

        return { vars = { self.config.extra.retriggers, numerator, denominator } }
    end
}