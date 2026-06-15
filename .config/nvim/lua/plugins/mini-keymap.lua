return {
	"nvim-mini/mini.keymap",
	config = function()
		local map = require("mini.keymap").map_multistep
		map("i", "<Tab>",   { "pmenu_next" })
		map("i", "<S-Tab>", { "pmenu_prev" })
		map("i", "<CR>",    { "pmenu_accept" })
	end
}
