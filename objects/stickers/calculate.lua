function Card:calculate_sticker(context, key)
  local sticker = SMODS.Stickers[key]

  if sticker.pre_calculate then
    sticker:pre_calculate(self, context)
  end

  if self.ability[key] and type(sticker.calculate) == 'function' then
    local o = sticker:calculate(self, context)

    if o then
      if not o.card then o.card = self end
    return o
    end
  end
end
