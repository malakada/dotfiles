local M = {}

M.setup = function(capabilities)
	return {
		capabilities = capabilities,
		cmd = {
			"bundle",
			"exec",
			"rubocop",
			"--lsp",
		},
		root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
	}
end
