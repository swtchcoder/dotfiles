--[[
alpha is a fast and fully programmable greeter for neovim.
]]
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		--[[
		neovim colored ascii
		https://github.com/DaiterGG/neovim-config/blob/b066d0bc66323d70cd423a006faf53e6ba4a08ff/lua/custom/plugins/alpha.lua

		MIT license
		]]
		local fill = vim.fn.winheight(0) - 43
		local logo = (fill >= 0 and [[










		]] or "") .. [[
                                              
       ███████████           █████      ██
      ███████████             █████ 
      ████████████████ ███████████ ███   ███████████
     ████████████████ ████████████ █████ ██████████████
    █████████████████████████████ █████ █████ ████ █████
  ██████████████████████████████████ █████ █████ ████ █████
 ██████  ███ █████████████████ ████ █████ █████ ████ ██████
 ██████   ██  ███████████████   ██ █████████████████

		]]

		-- Highlight groups configuration for each segment
		local header_hl = {}

		table.insert(header_hl, { { "AlphaHeader0_0", 46, 48 } }) -- Line 10
		table.insert(header_hl, { -- Line 11
			{ "AlphaHeader1_0", 7, 22 },
			{ "AlphaHeader1_1", 33, 40 },
			{ "AlphaHeader1_2", 40, 50 },
		})
		table.insert(header_hl, { -- Line 12
			{ "AlphaHeader2_0", 6, 21 },
			{ "AlphaHeader2_1", 33, 45 },
		})
		table.insert(header_hl, { -- Line 13
			{ "AlphaHeader3_0", 6, 19 },
			{ "AlphaHeader3_1", 19, 20 },
			{ "AlphaHeader3_2", 20, 35 },
			{ "AlphaHeader3_3", 35, 45 },
			{ "AlphaHeader3_4", 45, 90 },
		})
		table.insert(header_hl, { -- Line 14
			{ "AlphaHeader4_0", 5, 18 },
			{ "AlphaHeader4_1", 18, 36 },
			{ "AlphaHeader4_2", 36, 45 },
			{ "AlphaHeader4_3", 45, 90 },
		})
		table.insert(header_hl, { -- Line 15
			{ "AlphaHeader5_0", 4, 17 },
			{ "AlphaHeader5_1", 17, 24 },
			{ "AlphaHeader5_2", 24, 28 },
			{ "AlphaHeader5_3", 28, 37 },
			{ "AlphaHeader5_4", 37, 46 },
			{ "AlphaHeader5_5", 46, 90 },
		})
		table.insert(header_hl, { -- Line 16
			{ "AlphaHeader6_0", 2, 17 },
			{ "AlphaHeader6_1", 17, 38 },
			{ "AlphaHeader6_2", 38, 45 },
			{ "AlphaHeader6_3", 46, 90 },
		})
		table.insert(header_hl, { -- Line 17
			{ "AlphaHeader7_0", 1, 17 },
			{ "AlphaHeader7_1", 17, 38 },
			{ "AlphaHeader7_2", 38, 45 },
			{ "AlphaHeader7_3", 46, 90 },
		})
		table.insert(header_hl, { -- Line 18
			{ "AlphaHeader8_0", 1, 37 },
			{ "AlphaHeader8_1", 37, 91 },
		})

		-- Neo

		vim.api.nvim_set_hl(0, "AlphaHeader1_0", { fg = "#4a90d9" })

		vim.api.nvim_set_hl(0, "AlphaHeader2_0", { fg = "#4f96de" })

		vim.api.nvim_set_hl(0, "AlphaHeader3_0", { fg = "#549bdc" })
		vim.api.nvim_set_hl(0, "AlphaHeader3_1", { fg = "#1a3a6b" })
		vim.api.nvim_set_hl(0, "AlphaHeader3_2", { fg = "#a8cef5" })

		vim.api.nvim_set_hl(0, "AlphaHeader4_0", { fg = "#5aa0de" })
		vim.api.nvim_set_hl(0, "AlphaHeader4_1", { fg = "#b0d4f8" })

		vim.api.nvim_set_hl(0, "AlphaHeader5_0", { fg = "#60a6e0" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_1", { fg = "#b8d8fa" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_2", { fg = "#1a3a6b" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_3", { fg = "#b8d8fa" })

		vim.api.nvim_set_hl(0, "AlphaHeader6_0", { fg = "#66ace3" })
		vim.api.nvim_set_hl(0, "AlphaHeader6_1", { fg = "#c0dcfb" })

		vim.api.nvim_set_hl(0, "AlphaHeader7_0", { fg = "#6cb2e6" })
		vim.api.nvim_set_hl(0, "AlphaHeader7_1", { fg = "#c8e0fc" })

		vim.api.nvim_set_hl(0, "AlphaHeader8_0", { fg = "#1a3a6b" })

		-- Vim

		vim.api.nvim_set_hl(0, "AlphaHeader0_0", { fg = "#a6c9ab" })

		vim.api.nvim_set_hl(0, "AlphaHeader1_1", { fg = "#386c3f" })
		vim.api.nvim_set_hl(0, "AlphaHeader1_2", { fg = "#a6c9ab" })

		vim.api.nvim_set_hl(0, "AlphaHeader2_1", { fg = "#3d7344" })

		vim.api.nvim_set_hl(0, "AlphaHeader3_3", { fg = "#407b48" })
		vim.api.nvim_set_hl(0, "AlphaHeader3_4", { fg = "#98c09c" })

		vim.api.nvim_set_hl(0, "AlphaHeader4_2", { fg = "#44844b" })
		vim.api.nvim_set_hl(0, "AlphaHeader4_3", { fg = "#a0c4a3" })

		vim.api.nvim_set_hl(0, "AlphaHeader5_4", { fg = "#488c51" })
		vim.api.nvim_set_hl(0, "AlphaHeader5_5", { fg = "#a6c9ab" })

		vim.api.nvim_set_hl(0, "AlphaHeader6_2", { fg = "#4d9356" })
		vim.api.nvim_set_hl(0, "AlphaHeader6_3", { fg = "#aecdb3" })

		vim.api.nvim_set_hl(0, "AlphaHeader7_2", { fg = "#509b59" })
		vim.api.nvim_set_hl(0, "AlphaHeader7_3", { fg = "#b7d1b9" })

		vim.api.nvim_set_hl(0, "AlphaHeader8_1", { fg = "#2e4e2a" })

		local utils = require("alpha.utils")

		local header_val = vim.split(logo, "\n")
		header_hl = utils.charhl_to_bytehl(header_hl, header_val, false)

		dashboard.section.header.opts.hl = header_hl
		dashboard.section.header.val = header_val

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			desc = "Add Alpha dashboard footer",
			once = true,
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				dashboard.section.footer.val = {}
				table.insert(dashboard.section.footer.val, "")
				table.insert(dashboard.section.footer.val, "")
				table.insert(dashboard.section.footer.val, "")
				table.insert(
					dashboard.section.footer.val,
					" Loaded " .. stats.count .. " plugins  in " .. ms .. " ms "
				)
				for _ = 1, fill do
					table.insert(dashboard.section.footer.val, "")
				end
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
		dashboard.section.buttons.opts.hl = "AlphaHeader1_0"

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", "<cmd>ene <CR>"),
			dashboard.button("f", "󰈞  Find file", "<cmd>Oil<cr>"),
			dashboard.button("q", "󰿅  Quit", "<cmd>q<cr>"),
		}

		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				vim.opt_local.showtabline = 0
				vim.opt_local.laststatus = 0
			end,
		})

		vim.api.nvim_create_autocmd("BufUnload", {
			buffer = 0,
			callback = function()
				vim.opt.showtabline = 2
				vim.opt.laststatus = 3
			end,
		})
		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.config)
	end,
}
