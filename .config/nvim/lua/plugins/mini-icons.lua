return {
	"nvim-mini/mini.icons",
	opts = {},
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
	config = function(_, opts)
		require("mini.icons").setup(opts)
		require("mini.icons").tweak_lsp_kind()
	end,
}
