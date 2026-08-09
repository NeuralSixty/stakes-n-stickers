SMODS.DrawStep:take_ownership('debuff', {
  key = 'debuff',
  order = 70,
  func = function(self)
    if (
        self.debuff and self.ability.debuff_sources and (self.ability.debuff_sources['toxic'] or self.ability.debuff_sources['perishable'] or (self.ability.sns_delayed and self.ability.sns_delay_tally > 0) or self.ability.crimson_heart_chosen) and not self.ability.sns_prevent_debuff_draw
    ) or (
        not self.debuff and self.ability.sns_keep_debuff_draw
    ) then
      self.children.center:draw_shader('debuff', nil, self.ARGS.send_to_shader)
      if self.children.front and (self.ability.delayed or not self:should_hide_front()) then
        self.children.front:draw_shader('debuff', nil, self.ARGS.send_to_shader)
      end
    end
  end,
  conditions = { vortex = false, facing = 'front' },
})
