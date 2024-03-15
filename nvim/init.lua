local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "airblade/vim-gitgutter",
  "ap/vim-css-color",
  "vim-airline/vim-airline",
  {
    "nvim-telescope/telescope.nvim", -- Ensure Telescope is included
    requires = { "nvim-lua/plenary.nvim" } -- Include Plenary as it's a dependency for Telescope
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-fzy-native.nvim",
      -- Explicitly include plenary and telescope here to ensure they're recognized as dependencies
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
  },
  "MaxMEllon/vim-jsx-pretty",
  "pangloss/vim-javascript",
  "scrooloose/nerdtree",
  "preservim/nerdcommenter",
  "ryanoasis/vim-devicons",
  "tiagofumo/vim-nerdtree-syntax-highlight",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "valloric/matchtagalways",
  "github/copilot.vim",
  "sheerun/vim-polyglot",
  "altercation/vim-colors-solarized",
  "bronson/vim-trailing-whitespace",
})

vim.g.mapleader = ","
vim.o.t_vb = ""
vim.o.tm = 500

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
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- Syntax enable and colorscheme
vim.cmd [[syntax enable]]
vim.o.background = "dark"
vim.cmd [[colorscheme solarized]]

-- Set the clipboard to use the system clipboard
vim.o.clipboard = "unnamedplus"

-- Set path to python
vim.g.python3_host_prog = "~/.config/nvim/venv/bin/activate"

------------------
-- Key mappings --
------------------

-- Smart way to move between windows
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', {noremap = true})

-- Move a line of text using ALT+[jk] or Command+[jk] on mac
vim.api.nvim_set_keymap('n', '<M-j>', 'mz:m+<cr>`z', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-k>', 'mz:m-2<cr>`z', {noremap = true})
vim.api.nvim_set_keymap('v', '<M-j>', ":m'>+<cr>`<my`>mzgv`yo`z", {noremap = true})
vim.api.nvim_set_keymap('v', '<M-k>', ":m'<-2<cr>`>my`<mzgv`yo`z", {noremap = true})

if vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1 then
  vim.api.nvim_set_keymap('n', '<D-j>', '<M-j>', {noremap = true})
  vim.api.nvim_set_keymap('n', '<D-k>', '<M-k>', {noremap = true})
  vim.api.nvim_set_keymap('v', '<D-j>', '<M-j>', {noremap = true})
  vim.api.nvim_set_keymap('v', '<D-k>', '<M-k>', {noremap = true})
end

------------------
-- Autocommands --
------------------

vim.api.nvim_create_autocmd("GUIEnter", {
  pattern = "*",
  command = "set vb t_vb="
})

-----------------------------
-- NERDTree customizations --
-----------------------------

-- Automatically open NERDTree when nvim starts unless a file is specified
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("NERDTree")
    end
  end,
})

-- Custom autocommands for NERDTree and file type settings
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
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

vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'

--------------------------------
-- Mapping for NERDTreeToggle --
--------------------------------

vim.api.nvim_set_keymap('n', '<Bslash>', ':NERDTreeToggle<CR>', {noremap = true, silent = true})

----------------------------
-- NERDCommenter settings --
----------------------------

vim.g.NERDCommentEmptyLines = 1
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDCompactSexyComs = 0
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDCustomDelimiters = { c = { left = '/**', right = '*/' } }
vim.g.NERDSpaceDelims = 1
vim.b.NERDSexyComMarker = ''

---------------------------------------------
-- Function to delete trailing white space --
---------------------------------------------

local function clean_extra_spaces()
  local save_cursor = vim.api.nvim_win_get_cursor(0)
  local old_query = vim.fn.getreg('/')
  vim.cmd('%s/\\s\\+$//e')
  vim.api.nvim_win_set_cursor(0, save_cursor)
  vim.fn.setreg('/', old_query)
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.js", "*.jsx", "*.md", "*.ts", "*.tsx", "*.php"},
  callback = clean_extra_spaces,
})

--------------------
-- Basic settings --
--------------------

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
