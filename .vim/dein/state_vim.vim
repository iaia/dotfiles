if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/root/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/root/.vim/dein'
let g:dein#_runtime_path = '/root/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/root/.vim/dein/.cache/.vimrc'
let &runtimepath = '/root/.vim,/var/lib/vim/addons,/root/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/root/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/root/.vim/after,/root/.vim/dein/repos/github.com/Shougo/dein.vim'
filetype off
