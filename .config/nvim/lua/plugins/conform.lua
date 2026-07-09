--[[
Lightweight yet powerful formatter plugin for Neovim
]]
return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "gofmt" },
				rust = { "rustfmt" },
				markdown = { "prettierd", "prettier" },
				typst = { "typstfmt" }
			},
		})
		vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_line_count(0)
		range = {
			start = { args.line1, 0 },
			["end"] = { math.min(args.line2, end_line), 0 },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })	end,
}
