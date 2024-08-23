return {
  "brenoprata10/nvim-highlight-colors",
  init = function()
    vim.opt.termguicolors = true
  end,
  opts = {
    render = "background",
    virtual_symbol = "■",
    virtual_symbol_position = "inline",
    enable_tailwind = true,
  },
  config = function(_, opts)
    require("nvim-highlight-colors").setup(opts)
  end,
}
