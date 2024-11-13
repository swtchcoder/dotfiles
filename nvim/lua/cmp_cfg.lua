local cmp = require("cmp")

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")


lspconfig.lua_ls.setup({
  capabilities = cmp_nvim_lsp.default_capabilities()
})

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" }
  })
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  })
})

