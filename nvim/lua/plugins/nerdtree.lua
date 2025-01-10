return {
	{
		"scrooloose/nerdtree",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Automatically open NERDTree when nvim starts unless a file is specified
			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				callback = function()
					if vim.fn.argc() == 0 then
						vim.cmd("NERDTree")
					end
				end,
			})

			-- Always show hidden files
			vim.g.NERDTreeShowHidden = 1

			-- Custom autocommands for NERDTree and file type settings
			vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
				pattern = "*.es6",
				callback = function()
					vim.bo.filetype = "javascript"
				end,
			})

			vim.api.nvim_create_autocmd("StdinReadPre", {
				pattern = "*",
				callback = function()
					vim.g.std_in = 1
				end,
			})

			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				callback = function()
					if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv()[0]) == 1 and vim.g.std_in == nil then
						vim.cmd("NERDTree " .. vim.fn.argv()[0])
						vim.cmd("wincmd p")
						vim.cmd("ene")
					end
				end,
			})

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*",
				callback = function()
					if vim.fn.winnr("$") == 1 and vim.b.NERDTree ~= nil and vim.b.NERDTree.isTabTree then
						vim.cmd("q")
					end
				end,
			})

			vim.g.NERDTreeDirArrowExpandable = "▸"
			vim.g.NERDTreeDirArrowCollapsible = "▾"

			vim.api.nvim_set_keymap("n", "<Bslash>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
	"tiagofumo/vim-nerdtree-syntax-highlight",
}
