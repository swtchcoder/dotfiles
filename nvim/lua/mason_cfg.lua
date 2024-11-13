local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local lspconfig = require("lspconfig")


mason.setup()
mason_lspconfig.setup({
  automatic_installation = true
})


