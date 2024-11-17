local blink_cmp = require("blink.cmp")

blink_cmp.setup({
  keymap = {
    ["<CR>"] = {
      "accept",
      "fallback"
    },
    ["<Down>"] = {
      "select_next",
      "fallback"
    },
    ["<Up>"] = {
      "select_prev",
      "fallback"
    }
  },
  windows = { documentation = { auto_show = true } },
  sources = {
    completion = {
      enabled_providers = {
	      "lsp",
        "path",
        "buffer"
      }
    }
  }
})
