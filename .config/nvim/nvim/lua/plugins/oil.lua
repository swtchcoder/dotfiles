--[[
A vim-vinegar like file explorer that lets you edit your filesystem like a
normal Neovim buffer.
]]
local git_ignored_cache = {}

local function load_git_ignored(dir)
	if git_ignored_cache[dir] then
		return git_ignored_cache[dir]
	end

	local cmd = "git -C " .. vim.fn.shellescape(dir)
		.. " ls-files --others --ignored --exclude-standard"

	local handle = io.popen(cmd)
	if not handle then
		git_ignored_cache[dir] = {}
		return git_ignored_cache[dir]
	end

	local result = {}
	for line in handle:lines() do
		result[line] = true
	end
	handle:close()

	git_ignored_cache[dir] = result
	return result
end

return {
	"stevearc/oil.nvim",
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, bufnr)
					local dir = require("oil").get_current_dir(bufnr)
					if not dir then return false end
					if name:match("^%.") then
						return true
					end
					local ignored = load_git_ignored(dir)
					return ignored[name] == true
				end,
			},
		})
	end,
}
