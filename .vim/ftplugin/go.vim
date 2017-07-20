" ------------------- Go settings ------------------------
" No need to show invisibles
set nolist

" Enable highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Fix syntastic compatibility
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Auto imports
let g:go_fmt_command = "goimports"

" ------------------- Mappings ----------------------------
map <leader>c <Plug>(go-coverage)
map <leader>t <Plug>(go-test)
map <leader>i <Plug>(go-info)
map <leader>gi :GoImplement<CR>
map <leader>gd :GoDef<CR>
map <leader>gt :GoTests<CR>
map <leader>gb :GoBuild<CR>
