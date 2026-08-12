local M = {}

local build_commands = {}

local build_command_cache = nil
local run_command_cache = nil

local function build_command_get()
	if build_command_cache ~= nil then
		return build_command_cache
	end
	local root = vim.fn.getcwd()
	for build_command, files in pairs(build_commands) do
		for _, file in ipairs(files) do
			if vim.fn.filereadable(root .. "/" .. file) == 1 then
				build_command_cache = build_command
				return build_command
			end
		end
	end
	local build_command = vim.fn.input("build command: ", "", "file")
	if build_command == "" then
		vim.notify("aborting.", vim.log.levels.WARN)
		return nil
	end
	build_command_cache = build_command
	return build_command
end

local function run_command_get()
	local run_command = vim.fn.input("run command: ", run_command_cache or "./", "file")
	if run_command == "" then
		vim.notify("aborting.", vim.log.levels.WARN)
		return nil
	end
	run_command_cache = run_command
	return run_command
end

local function build_and_run()
	local build_command = build_command_get()
	if build_command == nil then
		return
	end
	local run_command = run_command_get()
	if run_command == nil then
		return
	end
	local command = string.format(
		"%s && DEBUGINFOD_URLS=\"https://debuginfod.elfutils.org\" valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes %s",
		build_command, run_command
	)
	vim.cmd("split | terminal " .. command)
end

function M.setup(opts)
	opts = opts or {}

	if opts.commands then
		build_commands = opts.commands
	end

	local keybind = opts.keybind
	if keybind == nil then
		keybind = "<C-b>"
	end

	vim.keymap.set({ "n", "i", "x", "t", "v" }, keybind, build_and_run)
end

return M
