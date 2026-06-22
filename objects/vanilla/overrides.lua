function G.UIDEF.stake_option(_type)

	local middle = {n=G.UIT.R, config={align = "cm", minh = 1.7, minw = 7.3}, nodes={
		{n=G.UIT.O, config={id = nil, func = 'RUN_SETUP_check_stake2', object = Moveable()}},
	}}

	local stake_options = {}
	local curr_options = {}
	local deck_usage = G.PROFILES[G.SETTINGS.profile].deck_usage[G.GAME.viewed_back.effect.center.key]
	local is_all_unlocked = G.PROFILES[G.SETTINGS.profile].all_unlocked
	local is_stake_available = SMODS.check_applied_stakes(G.P_CENTER_POOLS.Stake[G.viewed_stake], deck_usage or {wins_by_key = {}})
	G.viewed_stake = (is_all_unlocked or is_stake_available) and G.viewed_stake
		or (deck_usage and (math.min(get_deck_win_stake(G.GAME.viewed_back.effect.center.key) + 1, #G.P_CENTER_POOLS.Stake)))
		or 1
	for i=1, #G.P_CENTER_POOLS.Stake do
		if G.PROFILES[G.SETTINGS.profile].all_unlocked or SMODS.check_applied_stakes(G.P_CENTER_POOLS.Stake[i], deck_usage or {wins_by_key = {}}) then
			stake_options[#stake_options + 1] = i
			curr_options[i] = #stake_options
		end
	end

	return {n=G.UIT.ROOT, config={align = "tm", colour = G.C.CLEAR, minh = 2.03, minw = 8.3}, nodes={
		_type == 'Continue' and middle
		or create_option_cycle({options = stake_options, opt_callback = 'change_stake', current_option = curr_options[G.viewed_stake] or 1,
			colour = G.C.RED, w = 6, mid = middle})
	}}
end
