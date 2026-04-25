--[[
Neovim is a project that seeks to aggressively refactor Vim in order to:
* Simplify maintenance and encourage contributions
* Split the work between multiple developers
* Enable advanced UIs without modifications to the core
* Maximize extensibility
]]
require("config.vim")

--[[
lazy.nvim is a modern plugin manager for Neovim.
]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
	change_detection = {
		notify = false
	}
})

vim.cmd.colorscheme(require("utils.colorscheme")())
