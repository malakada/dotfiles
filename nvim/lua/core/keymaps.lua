------------------
-- Key mappings --
------------------

-- Smart way to move between windows
vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", { noremap = true })

-- Move a line of text using ALT+[jk] or Command+[jk] on mac
vim.api.nvim_set_keymap("n", "<M-j>", "mz:m+<cr>`z", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-k>", "mz:m-2<cr>`z", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-j>", ":m'>+<cr>`<my`>mzgv`yo`z", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-k>", ":m'<-2<cr>`>my`<mzgv`yo`z", { noremap = true })

if vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1 then
	vim.api.nvim_set_keymap("n", "<D-j>", "<M-j>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<D-k>", "<M-k>", { noremap = true })
	vim.api.nvim_set_keymap("v", "<D-j>", "<M-j>", { noremap = true })
	vim.api.nvim_set_keymap("v", "<D-k>", "<M-k>", { noremap = true })
end
