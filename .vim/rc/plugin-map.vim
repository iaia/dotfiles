" open-browser
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-fugitive
nnoremap gs :Gstatus<CR>
nnoremap ,gd :Gdiff<CR><C-W>H

" Ggrep Quickfix
nnoremap g[ :cprevious<CR>
nnoremap g] :cnext<CR>

" vimagit
nnoremap <Space><Space> :tabnew +MagitOnly<CR>

" twitter
nnoremap ,tp :PosttoTwitter<CR>

" nerdtree
nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>
nnoremap <Space>f :NERDTreeTabsFind<CR>
