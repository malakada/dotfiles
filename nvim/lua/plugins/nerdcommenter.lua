return {
  "preservim/nerdcommenter",
  config = function()
    vim.g.NERDCommentEmptyLines = 1
    vim.g.NERDTrimTrailingWhitespace = 1
    vim.g.NERDCompactSexyComs = 1
    vim.g.NERDDefaultAlign = "left"
    vim.g.NERDCustomDelimiters = { c = { left = "/**", right = "*/" } }
    vim.g.NERDSpaceDelims = 1
    vim.b.NERDSexyComMarker = ""
  end,
}
