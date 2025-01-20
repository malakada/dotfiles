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
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"emmet_language_server",
				"eslint",
				"erb-formatter",
				"erb-lint",
				"jsonls",
				"lua_ls",
				"rubocop",
				"ruby_lsp",
				"stylelint_lsp",
				"tailwindcss",
				"ts_ls",
				"vtsls",
				"yamlls",
			},
			automatic_installation = true,
		},
	},
}
