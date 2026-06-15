return {
	{ 
		"3rd/image.nvim", 
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor_mode = "popup",
					filetypes = { "markdown", "vimwiki" },
				},
				typst = {
					enabled = true,
					filetypes = { "typst" },
				},
			},
			window_overlap_clear_enabled = false,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
			kitty_method = "normal",
		}
	},
	{ 
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		build = function() require("typst-preview").update() end,
	},
}
