--[[
Lightweight yet powerful formatter plugin for Neovim
]]
return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofmt" },
				rust = { "rustfmt" }
			},
		})
	end,
}
