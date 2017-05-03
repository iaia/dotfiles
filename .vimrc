" Option {{{1
language C

set background=dark
colorscheme desert

set nocompatible 
syntax on
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" fileencodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

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

" dein

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
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax on
