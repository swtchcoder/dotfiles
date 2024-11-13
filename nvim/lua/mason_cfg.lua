local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")


mason.setup()
mason_lspconfig.setup({
  automatic_installation = true,
  handlers = {
    function (srv) 
      lspconfig[srv].setup({
        capabilities = cmp_nvim_lsp.default_capabilities()
      })
    end
  }
})


