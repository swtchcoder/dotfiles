call plug#begin()
Plug 'catppuccin/nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'brianhuster/autosave.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'sar/cmp-lsp.nvim'

Plug 'Bekaboo/dropbar.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'andweeb/presence.nvim'
call plug#end()

lua require'cmp_cfg'
lua require'mason_cfg'

lua require'lualine_cfg'
lua require'treesitter_cfg'
lua require'ibl_cfg'
lua require'presence_cfg'

lua require'toggleterm'.setup()
lua require'nvim-tree'.setup()
lua require'gitsigns'.setup()

colorscheme catppuccin-mocha
