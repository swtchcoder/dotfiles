--[[
nvim-lspconfig is a collection of LSP server configurations for the Nvim LSP
client.
]]
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.on_attach(function(_, bufnr)
			lsp_zero.default_keymaps({
				buffer = bufnr,
				preserve_mappings = false,
			})
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end)
		vim.diagnostic.config({
			virtual_text = {
				spacing = 1,
			},
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = true,
		})
		vim.lsp.config("*", { capabilities = capabilities })
		vim.lsp.enable({
			"clangd",
			"gopls",
			"rust_analyzer"
		})
	end
}
