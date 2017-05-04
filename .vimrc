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
set tabstop=4
set shiftwidth=4
set expandtab

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

" foldingに関する設定
set foldmethod=marker

" clipboardを使う
set clipboard=unnamed,autoselect

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

" Mappings {{{1

nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" <C-L>で検索後の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

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
" spaceでpagedown, shift+spaceでpageup
nnoremap <SPACE>j   <PageDown>
nnoremap <SPACE>k <PageUp>
map      <SPACE>g  G
vnoremap <SPACE>   <C-d>
" vnoremap <S-SPACE> <C-u>noremap <S-Space> <PageUp>

" xで消したものをレジスタに入れない
nnoremap x "_x

" 引用符等の設定
" カッコやクオートなどを入力した際に、左に自動で移動
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>
inoremap <> <><Left>

"検索したものを画面真ん中へ
map n nzz
" 上下に空白行を挿入
nnoremap <Space><S-o> :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <Space>o :<C-u>call append(expand('.'), '')<Cr>j
" 後ろに空白を挿入
nnoremap <Space>i i<Space><esc>
" space  
nnoremap <Space><Space> <PageDown>

" コマンドライン上でのマッピング. 当たり前のもののみ
cmap <C-h> <Backspace>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-p> <Up>
cmap <C-n> <Down>

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
    call dein#add('rust-lang/rust.vim')
    call dein#add('sjl/badwolf')
    " call dein#add('chriskempson/tomorrow-theme')
    " call dein#add('w0ng/vim-hybrid')
    " call dein#add('tomasr/molokai')
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on

" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1
colorscheme badwolf
syntax on


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

" }}}

" Blog {{{1
command! -nargs=0 WriteBlog call s:open_write_blog()
function! s:open_write_blog()

    let language = v:lc_time
    execute ":silent! language time " . "C"
    let l:blog_dir = $HOME . '/Documents/blog'. strftime('/%Y/%m/%d-%a')
    execute ":silent! language time " . language
    if !isdirectory(l:blog_dir)
        call mkdir(l:blog_dir, 'p')
    endif

    let l:filename = input('Blog title: ', l:blog_dir.strftime('/'))
    if l:filename != '
        execute 'edit ' . l:filename
    endif
endfunction

" }}}


