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

--------------------
-- Basic settings --
--------------------

-- Set the leader key
vim.g.mapleader = ","

-- Set the title of the window
-- vim.o.t_vb = ""

-- Set the timeout for key codes
vim.o.tm = 500

-- Don"t autocomment new lines after a comment
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

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
vim.g.python3_host_prog = "~/.config/nvim/venv/bin/activate"

------------------
-- Key mappings --
------------------

-- Smart way to move between windows
vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", {noremap = true})

-- Move a line of text using ALT+[jk] or Command+[jk] on mac
vim.api.nvim_set_keymap("n", "<M-j>", "mz:m+<cr>`z", {noremap = true})
vim.api.nvim_set_keymap("n", "<M-k>", "mz:m-2<cr>`z", {noremap = true})
vim.api.nvim_set_keymap("v", "<M-j>", ":m'>+<cr>`<my`>mzgv`yo`z", {noremap = true})
vim.api.nvim_set_keymap("v", "<M-k>", ":m'<-2<cr>`>my`<mzgv`yo`z", {noremap = true})

if vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1 then
  vim.api.nvim_set_keymap("n", "<D-j>", "<M-j>", {noremap = true})
  vim.api.nvim_set_keymap("n", "<D-k>", "<M-k>", {noremap = true})
  vim.api.nvim_set_keymap("v", "<D-j>", "<M-j>", {noremap = true})
  vim.api.nvim_set_keymap("v", "<D-k>", "<M-k>", {noremap = true})
end

------------------
-- Autocommands --
------------------

vim.api.nvim_create_autocmd("GUIEnter", {
  pattern = "*",
  command = "set vb t_vb="
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
  pattern = {"*.js", "*.jsx", "*.md", "*.ts", "*.tsx", "*.php", "*.rb", "*.lua", "*.erb", "*.html", "*.css", "*.scss", "*.json"},
  callback = clean_extra_spaces,
})

-- Syntax enable and colorscheme
vim.cmd [[syntax enable]]

require('lazy').setup({ { import = 'plugins' }, { import = 'plugins.lang' } }, {
	install = { colorscheme = { 'terafox' } },
	concurrency = #vim.loop.cpu_info(),
	checker = { enabled = true, concurrency = #vim.loop.cpu_info(), notify = false },
	change_detection = { notify = false },
})

---------------------------
-- Setup for avante.nvim --
---------------------------

-- views can only be fully collapsed with the global statusline
-- vim.opt.laststatus = 3

-- require('img-clip').setup ()
-- require('copilot').setup ({
--   endpoint = "https://api.githubcopilot.com",
--   model = "gpt-4o-2024-05-13",
--   proxy = nil, -- [protocol://]host[:port] Use this proxy
--   allow_insecure = false, -- Allow insecure server connections
--   timeout = 30000, -- Timeout in milliseconds
--   temperature = 0,
--   max_tokens = 4096,
-- })
-- require('render-markdown').setup ()

require('avante_lib').load()
require('avante').setup ({
  {
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    provider = "claude", -- Recommend using Claude
    auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-sonnet-20241022",
      temperature = 0,
      max_tokens = 4096,
    },
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = true },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right", -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width
      sidebar_header = {
        enabled = true, -- true, false to enable/disable the header
        align = "center", -- left, center, right for title
        rounded = true,
      },
      input = {
        prefix = "> ",
        height = 8, -- Height of the input window in vertical layout
      },
      edit = {
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
        start_insert = true, -- Start insert mode when opening the ask window
        border = "rounded",
        ---@type "ours" | "theirs"
        focus_on_apply = "ours", -- which diff to focus after applying
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
      --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
      --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
      --- Disable by setting to -1.
      override_timeoutlen = 500,
    },
  }
})
