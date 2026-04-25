--[[
Portable package manager for Neovim that runs everywhere Neovim runs.
Easily install and manage LSP servers, DAP servers, linters, and formatters.
]]
return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	config = function()
		require("mason").setup()
	end
}
