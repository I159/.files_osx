"            ---=== The Great VIM config ===---
"                    *** since 2014 ***        

" ISSUES:
" * Multi file/buffer replace
" * Multi file/buffer jump
" * Multi word refactoring
" * List usages
" * Surround
" * Single letter commands conflicts
" * Not all bracket jumps work
" * Remove breckets in pair

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
" Short tabs
set tabstop=4
set shiftwidth=4
" Show trailing whitespaces
set list
set listchars=trail:.,tab:>-
" Highlite current line
set cursorline
" enable file type plugins
filetype plugin indent on
filetype plugin on
" Move backups to tmp
set backupdir=$TEMP,$TMP,.
" Let Nerdtree ignore vim backup files
let NERDTreeIgnore = ['\.swo$', '\.swp$']
" Open files on new buffers
let NERDTreeMapOpenInTab='\r'
let NERDTreeShowHidden=1
" Fold
set foldmethod=manual
set foldlevel=10

" ----------------------- mappings ------------------------------
" Set leader
let mapleader = ","

" Natural splits navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" Toggle paste mode
" FIXME
set pastetoggle=<leader>sp

" Single letter commands. FIXME: shouldn't be too much
" Save with ,w
map <leader>w :w<CR>
" Exit with ,q
map <leader>q :q<CR>
" Save and exit with ,x
map <leader>x :wq<CR>
" Toggle nerdtree
map <leader>n :NERDTreeToggle<CR>
" Reset NERDTree
map <leader>N :NERDTree<CR>
" Previous buffer
nnoremap <leader>b :bprevious<CR>
" NerdTree default size
map <leader>v :BuffergatorToggle<CR>

" Functional mapping
" Reset search highlighting
map <F4> :set hlsearch! hlsearch?<CR>


" Double letter commands.
" List recently edited files
map <leader>mr :MRU<CR>
map <leader>ls :ls<CR>
" Next buffer
map <leader>ff :bnext<CR>
" Line breaks
map <leader>lb i<CR><Esc>
map <leader>ll :s/,/\0\r/g<CR>
" Remove trailing whitespaces
map <leader>dt :%s/\s\+$//e<CR>
" Auto pairs
let g:AutoPairsShortcutToggle = '<leader>pp'
"let g:AutoPairsShortcutFastWrap = '<leader>fw'

" Ctrl commands
" Replace after cursor
map <C-g> <C-v>$s

" Custom functions. FIXME: make plugins
" Replace with confirmation
function! Refactor(old, new)
	exe 'set autowriteall'
	exe 'bufdo %s/' . a:old . '/' . a:new . '/gc'
endfunction

command -nargs=+ RefactorCmd :call Refactor(<f-args>)
vnoremap // y:RefactorCmd <C-R>" 

