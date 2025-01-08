------------------
-- Autocommands --
------------------

-- Syntax enable and colorscheme
-- vim.cmd([[syntax enable]])

-- Don't autocomment new lines after a comment
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("GUIEnter", {
	pattern = "*",
	command = "set vb t_vb=",
})

---------------------------------------------
-- Function to delete trailing white space --
---------------------------------------------

local function clean_extra_spaces()
	local save_cursor = vim.api.nvim_win_get_cursor(0)
	local old_query = vim.fn.getreg("/")
	vim.cmd("%s/\\s\\+$//e")
	vim.api.nvim_win_set_cursor(0, save_cursor)
	vim.fn.setreg("/", old_query)
end

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {
		"*.js",
		"*.jsx",
		"*.md",
		"*.ts",
		"*.tsx",
		"*.php",
		"*.rb",
		"*.lua",
		"*.erb",
		"*.html",
		"*.css",
		"*.scss",
		"*.json",
	},
	callback = clean_extra_spaces,
})
