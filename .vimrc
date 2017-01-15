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

" Allow backspacing
set backspace=2

" Let Nerdtree ignore vim backup files
let NERDTreeIgnore = ['\.swo$', '\.swp$']

" Include Go specific settings
au FileType go source .go.vim

" Include Py specific settings
au FileType python source .py.vim

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

" Buffers navigation
map <leader>b :bprevious<CR>
map <leader>f :bnext<CR
map <leader>ls :ls<CR>
