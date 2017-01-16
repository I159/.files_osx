" ------------------- Settings ----------------------------

" Let Nerdtree ignore .pyc
let NERDTreeIgnore = ['\.pyc$']

" 80 symbols color column
set colorcolumn=80
highlight ColorColumn ctermbg=233
highlight OverLength ctermfg=244
match OverLength /\%80v.*/

" Enable python syntax checker
let g:syntastic_python_checkers = ['pylint']

" Syntastic settings
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0

" Enable advanced python syntax
let python_highlight_all = 1

" ------------------- Mappings ---------------------------
" Toggle syntastic
map <C-w> :SyntasticCheck<CR> :SyntasticToggleMode<CR>
