let config_root = stdpath('config')

exec 'so' . config_root . '/config.vim'
exec 'so' . config_root . '/plugins.vim'
