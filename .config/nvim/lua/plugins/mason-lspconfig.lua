--[[
Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
]]
return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	opts = function()
		return {
			ensure_installed = {
				"clangd", -- c/c++/obj-c
				"gopls", -- go
				"rust_analyzer", -- rust
				"pyright", -- python
				"tinymist" -- typst
			},
			automatic_enable = true,
		}
	end
}
