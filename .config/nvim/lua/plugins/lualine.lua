--[[
A blazing fast and easy to configure neovim statusline plugin written in pure
lua.
]]
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
				theme = require("utils.colorscheme")()
			},
			extensions = {
				"oil"
			},
		})
	end,
}
