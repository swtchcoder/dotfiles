local M = {}

local buffer = nil
local in_terminal = false
local previous_buffer = nil

local function toggle()
	if in_terminal then
		if previous_buffer and vim.api.nvim_buf_is_valid(previous_buffer) then
			vim.api.nvim_win_set_buf(0, previous_buffer)
		end
		in_terminal = false
		return
	end

	previous_buffer = vim.api.nvim_get_current_buf()

	if not buffer or not vim.api.nvim_buf_is_valid(buffer) then
		buffer = vim.api.nvim_create_buf(false, true)
		vim.bo[buffer].buflisted = false
		vim.bo[buffer].bufhidden = "hide"
	end

	vim.api.nvim_win_set_buf(0, buffer)

	if vim.bo[buffer].buftype ~= "terminal" then
		vim.fn.termopen(vim.o.shell)
	end

	in_terminal = true
	vim.cmd("startinsert")
end

function M.setup(opts)
	opts = opts or {}

	local keybind = opts.keybind
	if keybind == nil then
		keybind = "<C-q>"
	end

	vim.keymap.set({ "n", "i", "x", "t", "v" }, keybind, toggle)
end

return M
