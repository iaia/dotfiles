colorscheme desert
syntax on
set t_Co=256

" 120桁目に印
"set colorcolumn=120
let &colorcolumn=join(range(120, 9999), ',')
highlight ColorColumn ctermbg=235 guibg=#2c2d27
