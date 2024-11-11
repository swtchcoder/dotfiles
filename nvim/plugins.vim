let plugin_list = [
  \ 'catppuccin/nvim',
  \ 'nvim-tree/nvim-tree.lua',
  \ 'brianhuster/autosave.nvim',
  \ 'nvim-lualine/lualine.nvim',
  \ 'nvim-tree/nvim-web-devicons',
  \ 'nvim-treesitter/nvim-treesitter',
  \ 'lukas-reineke/indent-blankline.nvim',
  \ 'neovim/nvim-lspconfig',
  \ 'hrsh7th/nvim-cmp',
  \ 'hrsh7th/cmp-buffer',
  \ 'hrsh7th/cmp-path',
  \ 'Bekaboo/dropbar.nvim',
  \ 'akinsho/toggleterm.nvim'
\ ]

let lua_module_list = [
  \ 'cmp_cfg',
  \ 'lualine_cfg',
  \ 'treesitter_cfg',
  \ 'ibl_cfg',
\ ]

call plug#begin()
for i in plugin_list
  Plug i
endfor
call plug#end()

for i in lua_module_list
  exec 'lua require"' . i . '"'
endfor

colorscheme catppuccin-mocha
lua require"toggleterm".setup()
lua require"nvim-tree".setup()
