return {
	"nvim-mini/mini.hues",
	config = function()
		local fallback = {
			background = "#002734",
			foreground = "#c0c8cc",
			saturation = "mediumhigh"
		}

		local ok, data = pcall(function()
			local path = vim.fn.expand("~/.cache/wal/colors.json")
			local f = io.open(path, "r")
			if not f then return nil end
			local content = f:read("*a")
			f:close()
			return vim.fn.json_decode(content)
		end)

		local colors = fallback

		if ok and data and data.special then
			colors = {
				background = data.special.background or fallback.background,
				foreground = data.special.foreground or fallback.foreground,
				saturation = "mediumhigh",
			}
		end

		require("mini.hues").setup(colors)
	end
}
