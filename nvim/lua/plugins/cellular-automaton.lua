local cel_desc = Utils.plugin_keymap_desc("CellularAutomaton")

return {
	{
		"eandrju/cellular-automaton.nvim",
		keys = {
			{ ",fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = cel_desc("Make it rain") },
		},
	},
}
