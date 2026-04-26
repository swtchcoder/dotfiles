--[[
Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat,
left-right/up-down motions, hooks, and more
]]
return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
	end,
}
