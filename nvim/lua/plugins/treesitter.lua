return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "windwp/nvim-ts-autotag", opts = {} },
	},
	build = ":TSUpdate",
	lazy = false,
	init = function()
		vim.opt.foldenable = false
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"bash",
			"comment",
			"css",
			"diff",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"gpg",
			"html",
			"http",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"php",
			"regex",
			"ruby",
			"scss",
			"sql",
			"tmux",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
			"xml",
		},
		auto_install = true,
		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-i>",
				node_incremental = "<c-i>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		indent = {
			enable = true,
			disable = {},
		},
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		require("nvim-treesitter.install").compilers = { "zig" }

		local parsers = require("nvim-treesitter.parsers")
		local parser_configs = parsers.get_parser_configs()
		parser_configs.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
	end,
}
