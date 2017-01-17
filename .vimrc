"            ---=== The Great VIM config ===---
"                    *** since 2014 ***        


" ----------------------- settings -----------------------------

" Disable vi compatibility
set nocompatible

" Syntax on... any kind of
syntax on

" Set line numbers
set nu

" Colorscheme wombat256
colorscheme wombat256mod

" Enable plugins
execute pathogen#infect()

" Confirm save on exit
set confirm

set nowrap

" Spell check
set spell

" Allow backspacing
set backspace=2

" Show trailing whitespaces
set list
set listchars=trail:.,tab:>-

" enable file type plugins
filetype plugin indent on
filetype plugin on

" Move backups to tmp
set backupdir=$TEMP,$TMP,.

" Let Nerdtree ignore vim backup files
let NERDTreeIgnore = ['\.swo$', '\.swp$']

" Open files on new buffers
let NERDTreeMapOpenInTab='\r'

" ----------------------- mappings ------------------------------
" Set leader
let mapleader = ","

" Toggle paste mode
set pastetoggle=<f5>

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

" Line break
map % i<CR><Esc>

" Remove trailing whitespaces
map <leader>dt :%s/\s\+$//e<CR>