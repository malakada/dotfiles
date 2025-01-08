-------------------
-- Basic options --
-------------------

-- Set the timeout for key codes
vim.o.tm = 500

-- Set the title of the window
-- vim.o.t_vb = ""

-- Always show the current position
vim.o.ruler = true

-- Turn backup off
vim.o.backup = false

-- Turn write backup off
vim.o.writebackup = false

-- Turn off swapfile
vim.o.swapfile = false

-- Set line numbers always
vim.wo.number = true

-- Always show current position
vim.o.ruler = true

-- Ignore case when searching
vim.o.ignorecase = true

-- When searching try to be smart about cases
vim.o.smartcase = true

-- Higlight search results
vim.o.hlsearch = true

-- Makes search act like search in modern browsers
vim.o.incsearch = true

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Be smart when using tabs ;)
vim.o.smarttab = true

-- 1 tab == 2 spaces (uh duh)
-- vim.o.shiftwidth = 2
-- vim.o.tabstop = 2
-- vim.o.softtabstop = 2
-- vim.o.expandtab = true
vim.bo.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.cindent = true
vim.o.autoindent = true

-- Set the clipboard to use the system clipboard
vim.o.clipboard = "unnamedplus"

-- Set path to python
vim.g.python3_host_prog = "~/.config/nvim/venv/bin/python3"

-- Make sure filetype and highlighting work correctly after a session is restored
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
