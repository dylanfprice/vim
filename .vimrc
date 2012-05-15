" Turn on plugins
syntax on
filetype plugin indent on

" Change colorscheme
"colorscheme slate

" Set tabs to be 2 spaces wide
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set expandtab

" Set wrap on and end at full words
set wrap
set linebreak

" Map <Ctrl>-F to <Esc>
imap  <Esc>

" Settings for VimClojure
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
let vimclojure#DynamicHighlighting = 1
let vimclojure#WantNailgun = 1

" Automatically save and load folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Don't abandon buffers when they are unloaded
set hidden

" Make jumping to mark line and column easier
nnoremap ' `
nnoremap ` '

" Set <Leader> and <LocalLeader>
let mapleader = ","
let maplocalleader = "<SPACE>"

" Extended history
set history=1000

" Extended % matching
runtime macros/matchit.vim

" Make TAB completion in command mode like a shell
set wildmode=list:longest

" Ignore case on / searches, but not on * searches
set ignorecase 
set smartcase
" Un-highlight highlighted words
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Set the terminal title
set title

" Scroll before cursor hits very bottom to maintain more context
set scrolloff=3

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" See where you are in the buffer in lower right corner
set ruler

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

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
