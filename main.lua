if not SNS then
  SNS = {}
end

assert(SMODS.load_file("objects/vanilla/overrides.lua"))()

assert(SMODS.load_file("objects/smods/overrides.lua"))()

assert(SMODS.load_file("objects/stakes/plastic.lua"))()
assert(SMODS.load_file("objects/stakes/clay.lua"))()
assert(SMODS.load_file("objects/stakes/ceramic.lua"))()

assert(SMODS.load_file("objects/stickers/overrides.lua"))()
assert(SMODS.load_file("objects/stickers/magnet.lua"))()
assert(SMODS.load_file("objects/stickers/delayed.lua"))()
assert(SMODS.load_file("objects/stickers/toxic.lua"))()
assert(SMODS.load_file("objects/stickers/supercritical.lua"))()

assert(SMODS.load_file("objects/atlas/modicon.lua"))()
assert(SMODS.load_file("objects/atlas/stickers.lua"))()

assert(SMODS.load_file("objects/jokers/calculate.lua"))()
assert(SMODS.load_file("objects/jokers/overrides.lua"))()

assert(SMODS.load_file("objects/spectrals/overrides.lua"))()
