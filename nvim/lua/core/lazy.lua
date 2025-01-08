local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.colorscheme" },
	},
	change_detection = {
		notify = false,
		enabled = true,
	},
	install = {
		colorscheme = { "everforest" },
	},
	concurrency = #vim.loop.cpu_info(),
	checker = {
		enabled = true,
		concurrency = #vim.loop.cpu_info(),
		notify = false,
	},
	performance = {
		cache = { enabled = true },
	},
	ui = {
		border = "rounded",
		size = {
			height = 0.7,
			width = 0.7,
		},
		icons = {
			cmd = " ",
			config = " ",
			event = " ",
			ft = " ",
			init = " ",
			keys = " ",
			plugin = " ",
			runtime = " ",
			source = " ",
		},
	},
})
