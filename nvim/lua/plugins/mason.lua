-- Easily install and manage LSP servers, DAP servers, linters, and formatters.

return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				"markdownlint",
				"marksman",
				"shfmt",
				"stylua",
			},
			ui = { border = "single" },
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		event = "VeryLazy",
		opts_extend = { "ensure_installed" },
		ensure_installed = {
			"bashls",
			"cssls",
			"emmet_language_server",
			-- "eslint",
			-- "erb_format",
			-- "erb_lint",
			"html",
			"jsonls",
			"lua_ls",
			-- "rubocop",
			"ruby_lsp",
			"stylelint_lsp",
			"tailwindcss",
			"ts_ls",
			"vtsls",
			"yamlfix",
		},
		automatic_installation = true,
	},
}
