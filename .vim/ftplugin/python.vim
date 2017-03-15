" ------------------- Settings ----------------------------

" Let Nerdtree ignore .pyc
let NERDTreeIgnore = ['\.pyc$']

" 80 symbols color column
set colorcolumn=120
highlight ColorColumn ctermbg=233
highlight OverLength ctermfg=244
match OverLength /\%120v.*/

" Enable python syntax checker
let g:syntastic_python_checkers = ['pylint']

" Syntastic settings
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_python_python_exec = "$(which python3)"
let g:syntastic_python_pylint_exe = "$(which pylint)"

" Enable advanced python syntax
let python_highlight_all = 1

" ------------------- Mappings ---------------------------
" Toggle syntastic
map <C-x> :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Jedi: list usages
let g:jedi#usages_command = "<leader>u"

