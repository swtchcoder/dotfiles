local function clang_format(self, ctx)
	local project_config = vim.fs.find(".clang-format", {
		path = ctx.dirname,
		upward = true,
	})[1]
	if project_config then
		return {}
	end
	return {
		"--style=file" .. vim.fn.expand("~/.config/nvim/format/clang-format"),
	}
end

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" }
			},
			--[[format_on_save = {
				--timeout_ms = 0,
				lsp_format = "fallback",
			},]]--
			formatters = {
				clang_format = {
					command = "clang-format",
					inherit = true,
					prepend_args = { clang_format },
				},
			},
		})
	end,
}
