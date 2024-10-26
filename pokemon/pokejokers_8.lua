-- Qwilfish 211
-- Scizor 212
-- Shuckle 213
-- Heracross 214
-- Sneasel 215
-- Teddiursa 216
-- Ursaring 217
-- Slugma 218
-- Magcargo 219
-- Swinub 220
-- Piloswine 221
-- Corsola 222
-- Remoraid 223
-- Octillery 224
-- Delibird 225
-- Mantine 226
-- Skarmory 227
-- Houndour 228
-- Houndoom 229
-- Kingdra 230
local kingdra={
  name = "kingdra", 
  pos = {x = 0, y = 0},
  config = {extra = {mult = 10, mult_mod = 3, Xmult = 1, Xmult_mod = .1}},
  loc_txt = {      
    name = 'Kingdra',      
    text = {
      "Gains {C:mult}+#2#{} Mult for each",
      "scoring {C:attention}6{}, if you have",
      "a {C:attention}King{} held in hand gain",
      "{X:red,C:white}X#4#{} Mult {C:attention}as well{}",
      "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult, {X:red,C:white}X#3#{} Mult{C:inactive})",
    } 
  }, 
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.Xmult, center.ability.extra.Xmult_mod}}
  end,
  rarity = 2, 
  cost = 6, 
  stage = "One", 
  ptype = "Water",
  atlas = "Pokedex2",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint then
        local upgraded = nil
        local has_king = nil
        for i = 1, #G.hand.cards do 
          if G.hand.cards[i]:get_id() == 13 then has_king = true; break end
        end
        for k, v in ipairs(context.scoring_hand) do
          if v:get_id() == 6 then
            upgraded = true
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            if has_king then
              card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            end
          end
        end
        if upgraded then
          return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
          }
        end
      end
      if context.joker_main then
        return {
          message = "Twister!", 
          colour = G.C.XMULT,
          mult_mod = card.ability.extra.mult,
          Xmult_mod = card.ability.extra.Xmult
        }
      end
    end
  end,
}
-- Phanpy 231
-- Donphan 232
-- Porygon2 233
-- Stantler 234
-- Smeargle 235
-- Tyrogue 236
-- Hitmontop 237
-- Smoochum 238
-- Elekid 239
-- Magby 240
return {name = "Pokemon Jokers 211-240", 
        list = {kingdra},
}