local nvim_treesitter_configs = require("nvim-treesitter.configs")

nvim_treesitter_configs.setup({
  auto_install = true, -- recommended to have `tree-sitter` CLI installed locally
  ensure_installed = { "comment" },
  highlight = {
    enable = true,
    additional_vim_regex_highlioghting = false
  }
})