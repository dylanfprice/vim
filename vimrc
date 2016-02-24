" Set up pathogen
call pathogen#infect()
call pathogen#helptags()

" Turn on plugins
syntax on
filetype plugin indent on

" Change colorscheme
set background=dark
colorscheme solarized
set t_Co=256

" Set tabs to be 4 spaces wide
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab

" Set wrap on and end at full words
set wrap
set linebreak

" Automatically save and load folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Don't abandon buffers when they are unloaded
set hidden

" Make jumping to mark line and column easier
nnoremap ' `
nnoremap ` '

" Set <Leader> and <LocalLeader>
let mapleader = " "
let maplocalleader = "\\"

" Extended history
set history=1000

" Make TAB completion in command mode like a shell
set wildmode=list:longest

" Ignore case on / searches, but not on * searches
set ignorecase
set smartcase

" Set the terminal title
set title

" Scroll before cursor hits very bottom to maintain more context
set scrolloff=3

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" See where you are in the buffer in lower right corner
set ruler

" allows incsearch highlighting for range commands
" e.g. ?pattern$t copies the line that matches pattern to below the current
" line
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``

" Less interruptive prompts
set shortmess=atI

" UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8

" Set vimdiff colors to be nicer
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

" close buffer without closing window
map <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" Move around window splits more efficiently
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Set no backup files
set nobackup

" backupcopy
"    "yes"   make a copy of the file and overwrite the original one
"    "no"    rename the file and write a new one
"    "auto"  one of the previous, what works best
:set backupcopy=yes

" do not show preview window during autocomplete
set completeopt-=preview

set wildignore+=*.pyc "ignore pyc files

" CtrlP settings
let g:ctrlp_map = '<leader>f'
nmap <leader><leader> :CtrlPBuffer<CR>

" Ag
let g:agprg="ag --column --ignore migrations"

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  " ignore dotfiles by default

" syntastic
nnoremap <leader>l :SyntasticCheck<CR>
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes':[], 'passive_filetypes': []}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
