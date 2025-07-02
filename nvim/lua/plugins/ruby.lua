-- Ruby configuration

return {
	{
		"vim-ruby/vim-ruby",
		config = function()
			vim.cmd([[autocmd FileType ruby setlocal indentkeys-=.]])
		end,
	},
	{
		"williamboman/mason.nvim",
		opts_extend = { "ensure_installed" },
		ensure_installed = {
			-- "solargraph",
			"ruby-lsp",
			-- "rubocop",
		},
	},

	-- {
	--   "RRethy/nvim-treesitter-endwise",
	--   event = "InsertEnter",
	--   config = function()
	--     require("nvim-treesitter.configs").setup({
	--       endwise = {
	--         enable = true,
	--       },
	--     })
	--   end,
	-- },
}
