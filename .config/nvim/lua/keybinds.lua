-- save
vim.keymap.set({ "n", "i", "x" }, "<C-s>", "<Esc><cmd>w<CR>")

-- resize buffer
vim.keymap.set(
	{ "n", "i", "x" }, "<C-S-Left>", "<Esc><cmd>vertical resize -2<CR>")
vim.keymap.set(
	{ "n", "i", "x" }, "<C-S-Right>", "<Esc><cmd>vertical resize +2<CR>")
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
vim.keymap.set("v", "<A-Down>", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-Up>", "<cmd>m '<-2<CR>gv=gv")

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

-- open explorer
vim.keymap.set({ "n", "t", "i", "x" }, "<C-o>", "<Esc><cmd>Oil<CR>")
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

-- indent selection
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- jump word
vim.keymap.set({ "n", "v" }, "<C-Right>", "w")
vim.keymap.set({ "n", "v" }, "<C-Left>", "b")
vim.keymap.set("i", "<C-Right>", "<C-o>w")
vim.keymap.set("i", "<C-Left>", "<C-o>b")
