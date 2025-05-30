-- Allows vscode style snippets to be used with native nvim snippets `vim.snippet`. Also comes with support for `friendly-snippets`.

return {
	"garymjr/nvim-snippets",
	opts = { search_paths = { vim.fn.stdpath("config") .. "/snippets/nvim" } },
	keys = {
		{
			"<Tab>",
			function()
				if vim.snippet.active({ direction = 1 }) then
					vim.schedule(function()
						vim.snippet.jump(1)
					end)
					return
				end
				return "<Tab>"
			end,
			expr = true,
			silent = true,
			mode = "i",
		},
		{
			"<Tab>",
			function()
				vim.schedule(function()
					vim.snippet.jump(1)
				end)
			end,
			expr = true,
			silent = true,
			mode = "s",
		},
		{
			"<S-Tab>",
			function()
				if vim.snippet.active({ direction = -1 }) then
					vim.schedule(function()
						vim.snippet.jump(-1)
					end)
					return
				end
				return "<S-Tab>"
			end,
			expr = true,
			silent = true,
			mode = { "i", "s" },
		},
	},
}
