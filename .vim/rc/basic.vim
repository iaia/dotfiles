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

" コマンドラインの高さを2行に
set cmdheight=2

" タイプ途中のコマンドを画面最下行に表示
set showcmd

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

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" helpを日本語優先
set helplang=ja,en

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" ビジュアルベルも無効化する
set t_vb=

" 画面最下行にルーラーを表示する
set ruler

" 常にタブ一覧表示
set showtabline=2

" foldingに関する設定
set foldmethod=marker

" clipboardを使う
set clipboard=unnamed,autoselect

" mouseをoffに
set mouse=

