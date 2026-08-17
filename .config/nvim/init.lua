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

require("lsp").setup({
	["clangd"] = { "c", "cpp" },
	["lua-language-server"] = { "lua" }
})

require("format").setup({
	["clang-format"] = { "c", "cpp" },
	["stylua"] = { "lua" }
})

require("build").setup({
	["make"] = { "Makefile", "makefile", "GNUmakefile" },
})
vim.keymap.set({ "n", "t", "i", "x" }, "<C-b>", "<Esc><cmd>Build<CR>")

require("term").setup({
	keybind = "<C-q>"
})

require("keybinds")

vim.pack.add({
	"https://github.com/vyfor/cord.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nyoom-engineering/oxocarbon.nvim",
	"https://github.com/lukas-reineke/virt-column.nvim",
	"https://github.com/norcalli/nvim-colorizer.lua",
	"https://github.com/nvim-mini/mini.completion",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-mini/mini.statusline",
	"https://github.com/nvim-mini/mini.icons"
})

vim.opt.background = "dark"
vim.cmd.colorscheme "oxocarbon"

package.preload["nvim-web-devicons"] = function()
	require("mini.icons").mock_nvim_web_devicons()
	return package.loaded["nvim-web-devicons"]
end
require("mini.icons").setup(opts)
require("mini.icons").tweak_lsp_kind()

require("mini.statusline").setup()

require("virt-column").setup({
	char = "∷",
})

require("colorizer").setup()

require("oil").setup({
	default_file_explorer = true,
	columns = {
		"icon",
		"size",
	},
	view_options = {
		show_hidden = true
	},
})

require("nvim-treesitter").setup({
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require(\"nvim-treesitter\").indentexpr()"
vim.wo.foldlevel = 99
vim.filetype.add({ extension = { h = "c" } })
