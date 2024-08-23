return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      ruby = { "rubocop", "html_beautifier" },
    },
    format_on_save = {
      -- timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
