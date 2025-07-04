-- Completion engine plugin for nvim written in lua. Completion sources are installed from external repositories and "sourced".

return {
	"hrsh7th/nvim-cmp",
	event = "VeryLazy",
	dependencies = {
		"garymjr/nvim-snippets",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"tailwind-tools",
	},
	config = function()
		local cmp = require("cmp")
		-- local lspkind = require("lspkind")
		local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			preselect = cmp.PreselectMode.None,
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert }),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
				["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select_opts),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select_opts),
				["<C-y>"] = cmp.mapping.complete(),
			},
			sources = cmp.config.sources({
				{ name = "lazydev", group_index = 0 },
				{ name = "nvim_lsp", keyword_length = 1 },
				{
					name = "snippets",
					entry_filter = function()
						local ctx = require("cmp.config.context")
						local in_string = ctx.in_syntax_group("String") or ctx.in_treesitter_capture("string")
						local in_comment = ctx.in_syntax_group("Comment") or ctx.in_treesitter_capture("comment")
						return not in_string and not in_comment
					end,
				},
			}, {
				{ name = "buffer", keyword_length = 3 },
				{ name = "emoji" },
				{ name = "calc" },
				{ name = "path" },
			}),
			formatting = {
				-- ---@type fun(entry: cmp.Entry, vim_item: vim.CompletedItem): vim.CompletedItem
				-- format = lspkind.cmp_format({
				--   mode = "symbol_text",
				-- }),
				---@type cmp.ItemField[]
				fields = { "abbr", "kind" }, -- Remove "menu" to avoid truncation
			},
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
	-- opts = function()
	--   return {
	--     formatting = {
	--       format = require("lspkind").cmp_format({
	--         before = require("tailwind-tools.cmp").lspkind_format,
	--       }),
	--     },
	--   }
	-- end,
}
