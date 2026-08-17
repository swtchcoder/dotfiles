local M = {}

function M.setup(opts)
	if not opts then
		return
	end
	for command, filetypes in pairs(opts) do
		vim.lsp.config[command] = {
			cmd = { command },
			filetypes = filetypes
		}
		vim.lsp.enable(command)
	end
end

return M
