--[[
A snazzy bufferline for Neovim

This plugin shamelessly attempts to emulate the aesthetics of GUI text
editors/Doom Emacs. It was inspired by a screenshot of DOOM Emacs using
centaur tabs.
]]
return {
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup(opts)
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
	opts = {
		always_show_bufferline = false,
	},
}
