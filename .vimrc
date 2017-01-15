"            ---=== The Great VIM config ===---
"                    *** since 2014 ***        


" ----------------------- settings -----------------------------

" Disable vi compatibility
set nocompatible

" Syntax on... any kind of
syntax on

" Set line numbers
set nu

" Set leader
let mapleader = ","

" Colorscheme wombat256
colorscheme wombat256mod

" Enable plugins
execute pathogen#infect()

" Confirm save on exit
set confirm

" Spell check
set spell


" ----------------------- mappings ------------------------------

" Save with ,w
map <leader>w :w<CR>

" Exit with ,q
map <leader>q :q<CR>

" Save and exit with ,x
map <leader>x :wq<CR>

" Natural splits navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Toggle nerdtree
map <leader>n :NERDTreeToggle<CR>

" List recently edited files
map <leader>mr :MRU<CR>
