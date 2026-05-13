local terminal_buffer = nil
local terminal_window = false
local previous_window = nil

local function float_buffer_open(buffer)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)

	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	return vim.api.nvim_open_win(buffer, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "single",
	})
end

local function terminal_toggle()
	if terminal_window and vim.api.nvim_win_is_valid(terminal_window) then
		vim.api.nvim_win_close(terminal_window, true)
		terminal_window = nil

		if previous_window and vim.api.nvim_win_is_valid(previous_window) then
			vim.api.nvim_set_current_win(previous_window)
		end
		return
	end

	previous_window = vim.api.nvim_get_current_win()

	if not terminal_buffer or not vim.api.nvim_buf_is_valid(terminal_buffer) then
		terminal_buffer = vim.api.nvim_create_buf(false, true)

		vim.bo[terminal_buffer].buflisted = false
		vim.bo[terminal_buffer].bufhidden = "hide"
	end

	terminal_window = float_buffer_open(terminal_buffer)

	if vim.bo[terminal_buffer].buftype ~= "terminal" then
		vim.fn.termopen(vim.o.shell)
	end

	vim.cmd("startinsert")
end

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

-- save
vim.keymap.set({ "n", "i", "x" }, "<C-s>", "<Esc><cmd>w<CR>")
-- quit buffer
vim.keymap.set({ "n", "i", "x" }, "<C-w>", "<Esc><cmd>q<CR>", { noremap = true })
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><cmd>q<CR>", { noremap = true })
-- resize buffer
vim.keymap.set({ "n", "i", "x" }, "<C-S-Left>", "<Esc><cmd>vertical resize -2<CR>")
vim.keymap.set(
	{ "n", "i", "x" },
	"<C-S-Right>",
	"<Esc><cmd>vertical resize +2<CR>"
)
vim.keymap.set("t", "<C-S-Left>", "<C-\\><C-n><cmd>vertical resize -2<CR>")
vim.keymap.set("t", "<C-S-Right>", "<C-\\><C-n><cmd>vertical resize +2<CR>")
-- move buffer
vim.keymap.set({ "n", "i", "x" }, "<C-A-Right>", "<Esc><cmd>vsplit | b#<CR>")
vim.keymap.set({ "n", "i", "x" }, "<C-A-Left>", "<Esc><cmd>vsplit | b#<CR>")
vim.keymap.set("t", "<C-A-Left>", "<C-\\><C-n><cmd>vsplit | b#<CR>")
vim.keymap.set("t", "<C-A-Right>", "<C-\\><C-n><cmd>vsplit | b#<CR>")
-- move lines
vim.keymap.set("n", "<A-Down>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<A-Up>", "<cmd>m .-2<CR>==")
vim.keymap.set("i", "<A-Down>", "<Esc><cmd>m .+1<CR>==gi")
vim.keymap.set("i", "<A-Up>", "<Esc><cmd>m .-2<CR>==gi")
vim.keymap.set("x", "<A-Down>", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("x", "<A-Up>", "<cmd>m '<-2<CR>gv=gv")
-- select
vim.keymap.set({ "n", "i" }, "<S-Up>", "<Esc>v<Up>")
vim.keymap.set({ "n", "i" }, "<S-Down>", "<Esc>v<Down>")
vim.keymap.set({ "n", "i" }, "<S-Left>", "<Esc>v<Left>")
vim.keymap.set({ "n", "i" }, "<S-Right>", "<Esc>v<Right>")
vim.keymap.set("x", "<S-Up>", "<Up>")
vim.keymap.set("x", "<S-Down>", "<Down>")
vim.keymap.set("x", "<S-Left>", "<Left>")
vim.keymap.set("x", "<S-Right>", "<Right>")
-- select all
vim.keymap.set({ "n", "i", "x" }, "<C-a>", "<Esc>ggVG")
-- remove selection
vim.keymap.set("x", "<BS>", '"_d')
-- quit visual
vim.keymap.set("x", "<Up>", "<C-c><Up>")
vim.keymap.set("x", "<Down>", "<C-c><Down>")
vim.keymap.set("x", "<Left>", "<C-c><Left>")
vim.keymap.set("x", "<Right>", "<C-c><Right>")
-- open file
vim.keymap.set({ "n", "t", "i", "x" }, "<C-o>", "<Esc><cmd>Oil<CR>")
-- toggle terminal
vim.keymap.set({ "n", "t", "i", "x" }, "<C-q>", terminal_toggle)
-- change buffer
vim.keymap.set({ "n", "i", "x" }, "<C-Tab>", "<Esc><cmd>bnext<CR>")
vim.keymap.set("t", "<C-Tab>", "<C-\\><C-n><cmd>bnext<CR>")
-- move focus between splits
vim.keymap.set({ "n", "i", "x" }, "<C-Right>", "<Esc><C-w>l")
vim.keymap.set({ "n", "i", "x" }, "<C-Left>", "<Esc><C-w>h")
vim.keymap.set({ "n", "i", "x" }, "<C-Up>", "<Esc><C-w>k")
vim.keymap.set({ "n", "i", "x" }, "<C-Down>", "<Esc><C-w>j")
vim.keymap.set("t", "<C-Right>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-Left>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-Up>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-Down>", "<C-\\><C-n><C-w>j")
-- search
vim.keymap.set({ "n", "i", "x" }, "<C-f>", "<Esc>/")
