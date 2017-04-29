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
