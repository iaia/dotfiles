" dein
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.vim/dein')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml('~/.vim/rc/dein.toml',      {'lazy': 0})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.

" quickrun
let g:quickrun_config = {
      \ "hook/output_encode/enable": 1,
      \ "hook/output_encode/encoding": "utf-8",
      \}
let g:quickrun_config['ruby'] = {
      \ "hook/output_encode/enable": 1,
      \ "hook/output_encode/encoding": "utf-8",
      \}
let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'outputter': 'browser',
      \}

" mru
let MRU_File = $HOME . '/.vim/.vim_mru_files'

" vim-trailing-whitespace
let g:extra_whitespace_ignored_filetypes = ['unite']

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers=['rubocop', 'mri']

" twitter
let twitvim_count = 40

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.

" vimagit
let g:magit_default_fold_level = 2
let g:magit_default_sections = ['global_help', 'info', 'unstaged', 'commit', 'staged']
