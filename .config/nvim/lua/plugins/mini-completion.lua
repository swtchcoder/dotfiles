return {
	"nvim-mini/mini.completion",
	opts = {
		delay = { completion = 100, info = 0, signature = 0 },
		window = {
			info = { height = 25, width = 80, border = "single" },
			signature = { height = 25, width = 80, border = "single" },
		},
		lsp_completion = {
			source_func = 'completefunc',
			auto_setup = true,
		},
	},
	config = function(_, opts)
		require("mini.completion").setup(opts)
	end,
}
