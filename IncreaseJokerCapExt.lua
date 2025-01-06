--- STEAMODDED HEADER
--- MOD_NAME: IncreaseJokerCapExt
--- MOD_ID: IncreaseJokerCapExt
--- MOD_AUTHOR: [Akita Attribute (extended by The_Joetube)]
--- MOD_DESCRIPTION: Increase Base Joker Capacity

----------------------------------------------
------------MOD CODE -------------------------
local config = SMODS.current_mod.config

table.insert(G.FUNCS, 'DT_reset_jokerCount')

G.FUNCS.DT_reset_jokerCount = function() config.max_joker_cap = 5 end


SMODS.current_mod.config_tab = function()
	return {n = G.UIT.ROOT, config = {
		-- config values here, see 'Building a UI' page
	}, nodes = {
		-- work your UI wizardry here, see 'Building a UI' page
		{n = G.UIT.C, config = {align = "cm", padding = 0.1}, nodes = { 
			create_slider({label = 'Max Joker Count',w = 4, h = 0.4, ref_table = config, ref_value = 'max_joker_cap', min = 1, max = 999}),
			
			{n=G.UIT.R, config={align = "cm"}, nodes={
				UIBox_button{label = {"Reset"}, button = 'DT_reset_jokerCount', minw = 1.7, minh = 0.4, scale = 0.5}
			}},
			{n=G.UIT.R, config = {align = "cm"}, nodes = {
				{n=G.UIT.T, config = {text = '(Slider only reloads upon UI Reload)', colour = G.C.UI.TEXT_LIGHT, scale = 0.35}},
			}}
		}}
	}}
end

local originalFuncRef = get_starting_params
function get_starting_params()
	newTable = originalFuncRef()
	newTable.joker_slots = math.ceil(config.max_joker_cap)
	return newTable
end

----------------------------------------------
------------MOD CODE END----------------------