" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" 最後の編集位置にカーソルを自動移動
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" <>を組み合わせとして認識させる
set matchpairs+=<:>

" :difforigで変更を表示
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
set splitright

" undoの履歴を保存
if has('persistent_undo')
  set undodir=~/.vim/.vimundo
  set undofile
endif

command! -nargs=0 UndoRefresh call s:undo_refresh()
function! s:undo_refresh()
  execute ":!rm -rf ~/.vim/.vimundo/*"
endfunction

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

" insert時にカーソルをvertical barに
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" vimgrepでcwを開く
autocmd QuickFixCmdPost *grep* cwindow
