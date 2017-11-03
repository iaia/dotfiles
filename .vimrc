" Option {{{1
language C

" background
set background=dark

"ファイル名補完時の挙動
set wildmode=longest,list,full

" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible
" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype plugin indent on

" コマンドライン補完を便利に
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" fileencodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" helpを日本語優先
set helplang=ja,en

"検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" オートインデント
set autoindent

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2
" statusline {{{
" ファイル名表示
set statusline=%f\ 
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w

" 以降右寄せ
set statusline+=%=
" branchを表示
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}\ 
" file encoding
set statusline+=[enc=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[l=%l/%L-%c]

" }}}

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" ビジュアルベルも無効化する
set t_vb=

" コマンドラインの高さを2行に
set cmdheight=2

" 行番号を表示
set number

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" 常にタブ一覧表示
set showtabline=2

" :difforigで変更を表示
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
set splitright

" foldingに関する設定
set foldmethod=marker

" clipboardを使う
set clipboard=unnamed,autoselect

" mouseをoffに
set mouse=

" 最後の編集位置にカーソルを自動移動
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" undoの履歴を保存
if has('persistent_undo')
  set undodir=~/.vim/.vimundo
  set undofile
endif

command! -nargs=0 UndoRefresh call s:undo_refresh()
function! s:undo_refresh()
  execute ":!rm -rf ~/.vim/.vimundo/*"
endfunction

set matchpairs+=<:>


" }}}

" plugin(dein), ftplugin {{{1

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')
  call dein#add('Shougo/dein.vim')
  call dein#add('vim-scripts/mru.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('tyru/open-browser.vim')
  call dein#add('tpope/vim-rails')
  call dein#add('slim-template/vim-slim')
  call dein#add('tpope/vim-fugitive', {
	    \ 'on_cmd' : 'Gstatus'
	    \ })
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-haml')
  call dein#add('twitvim/twitvim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('scrooloose/nerdtree')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('jreybert/vimagit')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

colorscheme desert
syntax on
set t_Co=256


" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

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

" }}}

" Options2 {{{
" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
  syntax on

  " PODバグ対策
  syn sync fromstart

  function! ActivateInvisibleIndicator()
    " 下の行の"　"は全角スペース
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
    "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
    "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
    "syntax match InvisibleTab "\t" display containedin=ALL
    "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
  endf
  augroup invisible
    autocmd!  invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif

" 120桁目に印
"set colorcolumn=120
let &colorcolumn=join(range(120, 9999), ',')
highlight ColorColumn ctermbg=235 guibg=#2c2d27

set showtabline=2

" insert時にカーソルをvertical barに
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" }}}

" Mappings {{{1

" map {{{
map      <SPACE>g  G

"検索したものを画面真ん中へ
map n nzz

" }}}

" nnoremap {{{

nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" tabの移動
nnoremap <C-l> :tabn<CR>
nnoremap <C-w><C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <C-w><C-h> :tabp<CR>

" spaceでpagedown, shift+spaceでpageup
nnoremap <SPACE>j   <PageDown>
nnoremap <SPACE>k <PageUp>

" xで消したものをレジスタに入れない
nnoremap x "_x

" 上下に空白行を挿入
nnoremap <Space><S-o> :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <Space>o :<C-u>call append(expand('.'), '')<Cr>j

" 後ろに空白を挿入
nnoremap <Space>i i<Space><esc>
" space
nnoremap <Space><Space> <PageDown>

" tag-jump でtabnew
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" tabnew
nnoremap <C-\> :tabnew %:h<CR>

" }}}

" inoremap {{{

" 下に移動
inoremap <C-j> <Down>
" 上に移動
inoremap <C-k> <Up>
" 左に移動
inoremap <C-b> <Left>
" 右に移動
inoremap <C-l> <Right>
" 右に移動
inoremap <C-f> <Right>

" 引用符等の設定
" カッコやクオートなどを入力した際に、左に自動で移動
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>
inoremap <> <><Left>

" }}}

" vnoremap {{{
vnoremap <SPACE>   <C-d>
" vnoremap <S-SPACE> <C-u>noremap <S-Space> <PageUp>

" }}}

" cmap {{{

" コマンドライン上でのマッピング
cmap <C-h> <Backspace>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-p> <Up>
cmap <C-n> <Down>
" }}}

" tnoremap {{{

tnoremap <C-w><C-h> <C-w>:tabp<CR>
tnoremap <C-w><C-l> <C-w>:tabn<CR>

" }}}

" plugin-mapping {{{

" twitter
nnoremap ,tp :PosttoTwitter<CR>

" vim-fugitive
nnoremap gs :Gstatus<CR>
nnoremap ,gd :Gdiff<CR><C-W>H

" open-browser
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vimagit
nnoremap <C-m> :Magit<CR>

" }}}

" }}}

" daily_reports {{{1
command! -nargs=0 DailyReports call s:open_write_daily_reports()
function! s:open_write_daily_reports()

    let language = v:lc_time
    execute ":silent! language time " . "C"
    let l:daily_reports_dir = $HOME . '/Documents/daily_reports'. strftime('/%Y/%m/%d-%a')
    execute ":silent! language time " . language
    if !isdirectory(l:daily_reports_dir)
        call mkdir(l:daily_reports_dir, 'p')
    endif

    let l:filename = strftime('%Y-%m-%d-%a') . '-reports.mkd'
    let l:filepath = input('title: ', l:daily_reports_dir.strftime('/') . l:filename)
    if l:filepath != ''
      autocmd BufNewFile,BufRead *-reports.mkd if getfsize(@%) <= 0 | 0read $HOME/.vim/templates/template_daily_reports.mkd | endif
      execute 'edit ' . l:filepath
    endif
endfunction

" }}}
