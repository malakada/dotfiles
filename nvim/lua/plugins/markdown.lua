local desc = Utils.plugin_keymap_desc("markdown preview")

return {
	{
		"lukas-reineke/headlines.nvim",
		opts = function()
			local opts = {}
			for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
				opts[ft] = {
					headline_highlights = {},
					-- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
					bullets = {},
				}
				for i = 1, 6 do
					local hl = "Headline" .. i
					vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
					table.insert(opts[ft].headline_highlights, hl)
				end
			end
			return opts
		end,
		ft = { "markdown", "norg", "rmd", "org" },
		config = function(_, opts)
			-- PERF: schedule to prevent headlines slowing down opening a file
			vim.schedule(function()
				require("headlines").setup(opts)
				require("headlines").refresh()
			end)
		end,
	},

	-- Preview markdown in your modern browser with syncrhonized scrolling and flexible configuration
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install", -- && rm -f package-lock.json && git restore .",
		ft = { "markdown" },
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		keys = {
			{ "<leader>mp", ":MarkdownPreview<CR>", mode = "n", desc = desc("Preview") },
		},
	},
}
