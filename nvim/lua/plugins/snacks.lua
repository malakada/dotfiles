return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		opts = {
			bigfile = { enabled = false },
			scroll = {},
			lazygit = { enabled = false },
			notifier = {},
			quickfile = { enabled = false },
			scope = { enabled = false },
			statuscolumn = { enabled = false },
			words = {
				debounce = 200, -- time in ms to wait before updating
				notify_jump = false, -- show a notification when jumping
				notify_end = true, -- show a notification when reaching the end
				foldopen = true, -- open folds after jumping
				jumplist = true, -- set jump point before jumping
				modes = { "n", "i", "c" }, -- modes to show references
			},
			dashboard = {
				sections = {
					{
						section = "header",
						padding = 2,
					},
					{
						section = "keys",
						padding = 2,
					},
					{
						section = "terminal",
						icon = " ",
						title = "Git Status",
						enabled = vim.fn.isdirectory(".git") == 1,
						cmd = "git diff --stat -B -M -C",
						height = 5,
						indent = 2,
						ttl = 5,
					},
					{
						section = "startup",
					},
				},
			},
		},
	},
}
