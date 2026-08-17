local M = {}
local commands = {}

local function format()
	local filetype = vim.bo.filetype
	if not commands[filetype] then
		vim.notify("no formatter")
		return
	end
	local filename = vim.fn.expand("%:p")
	vim.cmd("silent !" .. commands[filetype] .. " " .. vim.fn.shellescape(filename))
end

function M.setup(opts)
	if not opts then
		return
	end
	commands = {}
	for command, filetypes in pairs(opts) do
		for _, filetype in ipairs(filetypes) do
			commands[filetype] = command
		end
	end
	vim.api.nvim_create_user_command(
		"Format",
		function(_)
			format()
		end,
		{ nargs = "?" }
	)
end

return M
