return {
	"tpope/vim-vinegar",
	config = function()
		vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
	end,
}
