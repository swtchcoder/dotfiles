return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup()

    vim.cmd([[
      colorscheme gruvbox

      highlight VertSplit           guifg=#504945
      highlight WinSeparator        guifg=#504945
      highlight Indentline          guifg=#3c3836
      highlight IndentlineCurrent   guifg=#7c6f64
      highlight SignColumn                        guibg=#282828
      highlight DiagnosticSignError guifg=#fb4934 guibg=#282828
      highlight DiagnosticSignWarn  guifg=#fabd2f guibg=#282828
      highlight DiagnosticSignInfo  guifg=#83a598 guibg=#282828
      highlight DiagnosticSignHint  guifg=#fabd2f guibg=#282828
      highlight CursorLineNr        guifg=#ebdbb2
      highlight LineNr              guifg=#a89984
    ]])
  end
}
