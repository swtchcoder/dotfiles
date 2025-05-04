return {
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
      {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
      "neovim/nvim-lspconfig"
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false
        })
      end)

      require("lazy-lsp").setup()
    end
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "none",

        ["<Tab>"] = {
          "select_next",
          "fallback"
        },
        ["<Enter>"] = {
          "accept",
          "fallback"
        },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
        },
        ghost_text = { enabled = true },
        list = { selection = { preselect = false } }
      },
      sources = { default = { "lsp", "path", "buffer" } }
    }
  }
}
