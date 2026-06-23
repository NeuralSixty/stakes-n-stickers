function SMODS.applied_stakes_UI(i, stake_desc_rows, num_added)
	if num_added == nil then num_added = { val = 0 } end
	if G.P_CENTER_POOLS['Stake'][i].applied_stakes then
		for _, v in pairs(G.P_CENTER_POOLS['Stake'][i].applied_stakes) do
			if num_added.val < 8 then
				local _stake_desc = {}
				local _stake_center = G.P_CENTER_POOLS.Stake[i - 1]
				localize { type = 'descriptions', key = _stake_center.key, set = _stake_center.set, nodes = _stake_desc }
				local _full_desc = {}
				for k, v in ipairs(_stake_desc) do
					_full_desc[#_full_desc + 1] = {n = G.UIT.R, config = {align = "cm"}, nodes = v}
				end
				_full_desc[#_full_desc] = nil
				stake_desc_rows[#stake_desc_rows + 1] = {n = G.UIT.R, config = {align = "cm" }, nodes = {
					{n = G.UIT.C, config = {align = 'cm'}, nodes = {
						{n = G.UIT.C, config = {align = "cm", colour = get_stake_col(i - 1), r = 0.1, minh = 0.35, minw = 0.35, emboss = 0.05 }, nodes = {}},
						{n = G.UIT.B, config = {w = 0.1, h = 0.1}}}},
					{n = G.UIT.C, config = {align = "cm", padding = 0.03, colour = G.C.WHITE, r = 0.1, minh = 0.7, minw = 4.8 }, nodes =
						_full_desc},}}
			end
			num_added.val = num_added.val + 1
			num_added.val = SMODS.applied_stakes_UI(i - 1, stake_desc_rows,
				num_added)
		end
	end
end

function G.UIDEF.deck_stake_column(_deck_key)
	local deck_usage = G.PROFILES[G.SETTINGS.profile].deck_usage[_deck_key]
	local stake_col = {}
	local num_stakes = #G.P_CENTER_POOLS['Stake']
	for i = #G.P_CENTER_POOLS['Stake'], 1, -1 do
		local _wins = deck_usage and deck_usage.wins[i] or 0
		local valid_option = nil
		if (deck_usage and deck_usage.wins[i - 1])
			or (deck_usage and deck_usage.wins[math.min(i + 8, #G.P_CENTER_POOLS.Stake) - 1])
			or (deck_usage and deck_usage.wins[math.min(i + 16, #G.P_CENTER_POOLS.Stake) - 1])
			or (not next(G.P_CENTER_POOLS.Stake[i].applied_stakes or {}))
			or (not next(G.P_CENTER_POOLS.Stake[math.min(i + 8, #G.P_CENTER_POOLS.Stake)].applied_stakes or {}))
			or (not next(G.P_CENTER_POOLS.Stake[math.min(i + 16, #G.P_CENTER_POOLS.Stake)].applied_stakes or {}))
			or G.PROFILES[G.SETTINGS.profile].all_unlocked
		then
			valid_option = true
		end
		stake_col[#stake_col + 1] = {n = G.UIT.R, config = {id = i, align = "cm", colour = _wins > 0 and G.C.GREY or G.C.CLEAR, outline = 0, outline_colour = G.C.WHITE, r = 0.1, minh = 2 / num_stakes, minw = valid_option and 0.45 or 0.25, func = 'RUN_SETUP_check_back_stake_highlight'}, nodes = {
			{n = G.UIT.R, config = {align = "cm", minh = valid_option and 1.36 / num_stakes or 1.04 / num_stakes, minw = valid_option and 0.37 or 0.13, colour = _wins > 0 and get_stake_col(i) or G.C.UI.TRANSPARENT_LIGHT, r = 0.1}, nodes = {}}}}
		if i > 1 then stake_col[#stake_col + 1] = {n = G.UIT.R, config = {align = "cm", minh = 0.8 / num_stakes, minw = 0.04 }, nodes = {} } end
	end
	return {n = G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes = stake_col}
end
