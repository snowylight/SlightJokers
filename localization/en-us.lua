return {
    descriptions={
        Joker={
            j_slightjokers_blue_card={
                name="Blue Card",
                text={
                    "Gains {C:chips}+#1#{} Chips when any",
                    "{C:attention}Booster Pack{} is skipped",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                },
            },
            j_slightjokers_century_egg={
                name="Century Egg",
                text={
                    "{C:dark_edition}+#1#{} Joker Slot",
                    "At end of round",
                    "cash this joker's {C:attention}Sell Value{}",
                },
            },
            j_slightjokers_chinese_chef={
                name="Chinese Chef",
                text={
                    "Create a {C:attention}Century Egg{}, {C:attention}Rice Dumpling",
                    "{C:attention}Ramen{} or {C:attention}Turtle Bean",
                    "at the end of the {C:attention}shop",
                    "{C:inactive}(Must have room)",
                },
            },
            j_slightjokers_evil_astronaut={
                name="Evil Astronaut",
                text={
                    "All {C:attention}Poker Hands{} in this run will",
                    "count as {C:attention}double{} played in statistic",
                    "{C:green}#1# in #2#{} chance to upgrade",
                    "level of played {C:attention}poker hand{}",
                },
            },
            j_slightjokers_exiled_joker={
                name="Exiled Joker",
                text={
                    "Whenever a {C:attention}card{} is",
                    "added to your deck",
                    "add {X:mult,C:white}X#1#{} Mult to it",
                },
            },
            j_slightjokers_lava_erupt={
                name="Eruption",
                text={
                    "Played original non-scoring cards",
                    "will enhanced to {C:attention}Stone Cards{}",
                    "Revert after scoring",
                },
            },
            j_slightjokers_pe_student={
                name="Athlete Student",
                text={
                    "Gains {X:chips,C:white} X#1# {} Chips",
                    "if played hand",
                    "contains a {C:attention}Straight{}",
                    "{C:inactive}(Currently {X:chips,C:white} X#2# {C:inactive} Chips)",
                },
            },
            j_slightjokers_polar_climber={
                name="Polar Climber",
                text={
                    "Cards held in hand",
                    "gain {X:chips,C:white} X#1# {} Chips",
                    "at end of round",
                },
            },
            j_slightjokers_sam_club={
                name="Sam's Club",
                text={
                    "{C:attention}+#1#{} Card slot",
                    "available in shop",
                    "Enables {C:attention}Inflation",
                },
            },
            j_slightjokers_world_end={
                name="World's End",
                text={
                    "{C:planet}Planet{} in consumable slot",
                    "each give {C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
                    "and {X:mult,C:white} X#3# {} Mult",
                },
            },
            j_slightjokers_ignis_fatuus={
                name="Ignis Fatuus",
                text={
                    "This Joker gains {X:chips,C:white}X#1#{} Chips",
                    "for each card {C:attention}purchased{}, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {X:chips,C:white} X#2# {C:inactive} Chips)"
                },
            },
            j_slightjokers_minotaur={
                name="Minotaur",
                text={
                    "When {C:attention}Boss Blind{} begins",
                    "this Joker gains {C:chips}+#1#{} chips",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                },
            },
            j_slightjokers_mysterious_nebula={
                name="Mysterious Nebula",
                text={
                    "Adds the number of",
                    "times {C:attention}poker hand{} has",
                    "been played and",
                    "upgraded to Mult",
                },
            },
            j_slightjokers_old_phone={
                name="Old Phone",
                text={
                    "Retrigger",
                    "each played",
                    "{C:dark_edition}#1#{}, {C:dark_edition}#2#{}, {C:dark_edition}#3#{},",
                    "{C:attention}#4#{} or {C:attention}#5#{}",
                    "{s:0.8}change dialing every round",
                },
            },
            j_slightjokers_rice_dumpling={
                name="Rice Dumpling",
                text={
                    "Earn an extra {C:money}$#1#{} of",
                    "{C:attention}interest{} for every {C:money}$5{} you",
                    "have at end of round",
                    "reduces by {C:money}$#2#{}",
                    "when entering shop",
                },
            },
        },
        Other={
            slightjokers_ramen={
                name = 'Ramen',
                text = {
                    "{X:mult,C:white} X2 {} Mult,",
                    "loses {X:mult,C:white} X0.01 {} Mult",
                    "per {C:attention}card{} discarded",
                },
            },
            slightjokers_inflation={
                name = 'Inflation',
                text = {
                    "All prices increase",
                    "by {C:money}$1{}",
                    "after purchase",
                },
            },
        }
    },
    misc = {
        dictionary = {
            slightjokers_erupt_solidify="Solidify",
        },
        v_dictionary={
            slightjokers_worldend="+#1# Chips +#2# Mult X#3# Mult",
            slightjokers_ricedumpling="-$#1#",
        }
    }
}