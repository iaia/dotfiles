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

" tag-jump でtabnew
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" tabnew
nnoremap <C-\> :tabnew %:h<CR>

" copy current file path to clipboard
nnoremap cp :let @" = expand("%")<CR>

nnoremap ,cs :%s/\s*$//<CR>

nnoremap <Space>q :q<CR>
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

" ruby
" to 1.9 hash
vnoremap <silent> <C-h> :s/:\([a-zA-Z0-9_]\+\)\s*=>/\1:/g<CR>
