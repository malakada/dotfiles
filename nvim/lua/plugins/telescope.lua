return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-treesitter/nvim-treesitter",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
		init = function()
			local hl = vim.api.nvim_set_hl
			local p = require("nightfox.palette").load("dayfox")

			hl(0, "TelescopePreviewBorder", { fg = p.blue.dim })
			hl(0, "TelescopePreviewTitle", { fg = p.blue.base })

			hl(0, "TelescopePromptBorder", { fg = p.cyan.dim })
			hl(0, "TelescopePromptTitle", { fg = p.cyan.bright })

			hl(0, "TelescopeResultsBorder", { fg = p.orange.dim })
			hl(0, "TelescopeResultsTitle", { fg = p.orange.bright })
		end,
		keys = {
			{
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				desc = "Find files",
			},
			{
				"<leader>fg",
				"<cmd>Telescope live_grep<cr>",
				desc = "Grep files",
			},
			{
				"<leader>fb",
				"<cmd>lua require('telescope.builtin').buffers()<cr>",
				desc = "List buffers",
			},
			{
				"<leader>fh",
				"<cmd>lua require('telescope.builtin').help_tags()<cr>",
				desc = "Find help",
			},
		},
		opts = {
			defaults = {
				prompt_prefix = "❯ ",
				selection_caret = "❯ ",
			},
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			opts = { extensions = { "fzf" } },
		},
		init = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		lazy = true,
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
