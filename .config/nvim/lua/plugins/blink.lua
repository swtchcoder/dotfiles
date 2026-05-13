--[[
Performant, batteries-included completion plugin for Neovim
]]
return {
	"saghen/blink.cmp",
	opts = {
		keymap = {
			preset = "none",

			["<Tab>"] = {
				"select_next",
				"fallback",
			},
			["<Enter>"] = {
				"accept",
				"fallback",
			},
		},
		completion = {
			menu = {
				border = "single"
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = "single"
				}
			},
			ghost_text = { enabled = true },
			list = { selection = { preselect = false } },
		},
		fuzzy = {
			implementation = "lua",
		},
		sources = { default = { "lsp", "path", "buffer" } },
	},
}
