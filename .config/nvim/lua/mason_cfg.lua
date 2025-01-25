local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local lspconfig = require("lspconfig")
local blink_cmp = require("blink.cmp")

local capabilities = blink_cmp.get_lsp_capabilities()


mason.setup()
mason_lspconfig.setup({
  automatic_installation = true,
  handlers = {
    function (server) 
      lspconfig[server].setup({
        capabilities = capabilities
      })
    end
  }
})

