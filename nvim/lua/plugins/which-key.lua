return {
	"folke/which-key.nvim",
	init = function()
		vim.opt.timeout = true
		vim.opt.timeoutlen = 300
	end,
	event = "VeryLazy",
	opts = {
		-- preset = "modern",
		icons = {
			separator = ":",
			rules = false,
		},
		spec = {
			{ "<leader>f", group = "find" },
			{ "<leader>q", group = "quit" },
			{ "<leader>s", group = "search" },
			{ "<leader>t", group = "test/toggle" },
			{ "<leader>w", group = "windows" },
			{ "[", group = "prev" },
			{ "]", group = "next" },
			{ "g", group = "goto/actions" },
			{ "z", group = "folds/jumps/spelling" },
		},
	},
}
