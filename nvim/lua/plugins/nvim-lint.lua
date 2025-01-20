return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
			javascriptreact = { "eslint" },
			lua = { "luacheck" },
			markdown = { "markdownlint" },
			sh = { "shellcheck" },
			yaml = { "yamllint" },
			json = { "jsonlint" },
			css = { "stylelint" },
			scss = { "stylelint" },
			sass = { "stylelint" },
			less = { "stylelint" },
			html = { "htmllint" },
			vim = { "vint" },
			ruby = { "rubocop" },
			erb = { "erb_lint" },
		}

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
			callback = function()
				local lint_status, lint = pcall(require, "lint")
				if lint_status then
					lint.try_lint()
				end
			end,
		})
	end,
}
