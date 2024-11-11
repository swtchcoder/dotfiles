let nvim_config_root = stdpath('config')
let config_file_list = [
  \ 'config.vim',
  \ 'plugins.vim'
\ ]

for i in config_file_list
  exec 'so' . nvim_config_root . '/' . i
:endfor
