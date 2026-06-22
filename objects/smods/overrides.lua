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
