local M = {}

vim.diagnostic.config({ virtual_text = true })

vim.o.autocomplete = true
vim.o.completeopt = "menu,menuone,noselect,fuzzy,preview"
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
	end,
})

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
