-- Lightweight yet powerful formatter plugin for nvim

return {
	"stevearc/conform.nvim",
	opts = {
		quiet = true,
		formatters_by_ft = {
			-- languages
			css = { "prettier" },
			erb = { "erb_format" },
			eruby = { "erb_format" },
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
			-- javascriptreact = { "prettier" },
			lua = { "stylua" },
			ruby = { "rubocop" }, --, "htmlbeautifier" },
			scss = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			html = { "prettier" },

			-- config files
			bash = { "beautysh" },
			markdown = { "prettier" },
			sh = { "beautysh" },
			zsh = { "beautysh" },
			yaml = { "yamlfix" },
		},
		format_on_save = function(bufnr)
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") then
				return
			end

			return {
				timeout_ms = 1000,
				lsp_fallback = true,
			}
		end,
		log_level = vim.log.levels.DEBUG,
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)

		-- Customize rubocop args
		require("conform.formatters.rubocop").command = "bundle"
		require("conform.formatters.rubocop").args = function()
			local rubocop_config = vim.fn.findfile(".rubocop.yml", ".;")

			if vim.fn.filereadable(rubocop_config) == 1 then
				return {
					"exec",
					"rubocop",
					-- "--config",
					-- rubocop_config,
					-- "--autocorrect-all",
					-- "--format",
					"-A",
					"-f",
					"quiet",
					-- "--force-exclusion",
					"--stderr",
					"--stdin",
					"$FILENAME",

					-- rubocop_config,
					-- "--format",
					-- "quiet",
				}
			else
				return {
					-- "exec",
					-- "rubocop",
					-- "--format",
					-- "json",
					-- "--force-exclusion",
					-- "%filepath",

					"--fix-layout",
					"--auto-correct",
					"--stderr",
					"--stdin",
					"$FILENAME",
				}
			end
		end

		-- Customize prettier args
		require("conform.formatters.prettier").args = function(_, ctx)
			local prettier_roots = {
				".prettierrc",
				".prettierrc.json",
				"prettier.config.js",
			}

			local args = {
				"--stdin-filepath",
				"$FILENAME",
			}

			local config_path = vim.fn.stdpath("config")
			local localPrettierConfig = vim.fs.find(prettier_roots, {
				path = type(config_path) == "string" and config_path or config_path[1],
				type = "file",
			})[1]

			local disableGlobalPrettierConfig = os.getenv("DISABLE_GLOBAL_PRETTIER_CONFIG")

			-- Project config takes precedence over global config
			if localPrettierConfig then
				vim.list_extend(args, { "--config", localPrettierConfig })
			elseif globalPrettierConfig and not disableGlobalPrettierConfig then
				vim.list_extend(args, { "--config", globalPrettierConfig })
			end

			local hasTailwindPrettierPlugin = vim.fs.find("node_modules/prettier-plugin-tailwindcss", {
				upward = true,
				path = ctx.dirname,
				type = "directory",
			})[1]

			if hasTailwindPrettierPlugin then
				vim.list_extend(args, { "--plugin", "prettier-plugin-tailwindcss" })
			end

			return args
		end

		require("conform.formatters.erb_format").args = function()
			return {
				format_on_save = function(bufnr)
					-- Disable autoformat for yaml or yml files
					local bufname = vim.api.nvim_buf_get_name(bufnr)
					if bufname:match("%.ya?ml$") then
						return
					end
				end,
			}
		end

		conform.formatters.beautysh = {
			prepend_args = function()
				return {
					"--indent-size",
					"2",
					"--force-function-style",
					"fnpar",
				}
			end,
		}
	end,
}
