return {
	"nvim-mini/mini.statusline",
	opts = {
		content = {
			active = nil,
			inactive = nil,
		},
		use_icons = true,
	},
	config = function()
		require("mini.statusline").setup(opts)
	end
}
