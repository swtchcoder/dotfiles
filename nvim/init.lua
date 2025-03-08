local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "junegunn/seoul256.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.seoul256_background = 234
      vim.cmd("colorscheme seoul256")

      vim.cmd([[
        highlight LineNrAbove       guifg=#665c54 guibg=NONE gui=NONE
        highlight LineNrBelow       guifg=#665c54 guibg=NONE gui=NONE
        highlight Indentline        guifg=#665c54
        highlight IndentlineCurrent guifg=#a89984 
        highlight VertSplit         guifg=#665c54
        highlight WinSeparator      guifg=#665c54 
      ]])
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "seoul256",
        },
      })
    end,
  },
  {
    'Bekaboo/dropbar.nvim',
    config = function()
      local dropbar_api = require('dropbar.api')
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    "saghen/blink.cmp",
    opts = { 
      keymap = {
        ["<Tab>"] = {
          "accept",
          "fallback"
        },
        ["<Down>"] = {
          "select_next",
          "fallback"
        },
        ["<Up>"] = {
          "select_prev",
          "fallback"
        }
      },
      completion = { 
        documentation = { 
          auto_show = true,
          auto_show_delay_ms = 500
        },
        ghost_text = { enabled = true }
      },
      sources = { default = { "lsp", "path", "buffer" } },
    }
  },
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
      {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
      "neovim/nvim-lspconfig"
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false
        })
      end)

      require("lazy-lsp").setup {}
    end,
  },
  {
    "nvimdev/indentmini.nvim",
    config = function()
      require("indentmini").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "typescript", "rust" },
        highlight = {
          enable = true,
        },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.fillchars = "eob: "
vim.opt.mouse = "a"
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.shortmess:append("c")
vim.opt.laststatus = 3
