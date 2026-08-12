require("lsp").setup({
	commands = {
		["clangd"] = { "c", "cpp" }
	}
})

require("build").setup({
	commands = {
		make = { "Makefile", "makefile", "GNUmakefile" },
	},
	keybind = "<C-b>"
})

require("terminal").setup({
	keybind = "<C-q>"
})

vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.fillchars = "eob: "
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.shortmess:append("c")
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "79"
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", space = "·" }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("keybinds")

vim.pack.add({
	"https://github.com/vyfor/cord.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nyoom-engineering/oxocarbon.nvim",
	"https://github.com/lukas-reineke/virt-column.nvim",
	"https://github.com/norcalli/nvim-colorizer.lua"
})

vim.opt.background = "dark"
vim.cmd.colorscheme "oxocarbon"

require("virt-column").setup({
	char = "∷",
})

require('colorizer').setup()

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
