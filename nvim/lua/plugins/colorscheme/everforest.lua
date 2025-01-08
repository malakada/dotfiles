return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration. :>
		vim.g.everforest_enable_italic = true

		vim.opt.termguicolors = true

		-- Set contrast
		-- Available values: 'low' (default), 'high'
		vim.g.everforest_ui_contrast = "low"

		-- Set color scheme palette style
		-- Available values: 'hard', 'medium'(default), 'soft'
		vim.g.everforest_background = "soft"

		-- For better performance
		vim.g.everforest_better_performance = 1
	end,
}
