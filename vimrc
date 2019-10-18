" Set up pathogen
call pathogen#infect()
call pathogen#helptags()

" Set font size for gvim
set guifont=Monospace\ 12

" Change colorscheme
set t_Co=256
set background=light
colorscheme solarized

" Allow setting syntax and stuff in modeline
set modeline

" Set tabs to be 4 spaces wide
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
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

" Set <Leader> and <LocalLeader>
let mapleader = " "
let maplocalleader = "\\"

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

" allows incsearch highlighting for range commands
" e.g. ?pattern$t copies the line that matches pattern to below the current
" line
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``

" Less interruptive prompts
set shortmess=atI

" Set vimdiff colors to be nicer
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

" autocomplete behavior
set completeopt=menu,longest,preview

set wildignore+=*.pyc "ignore pyc files

" FZF settings
set rtp+=~/.fzf
nmap <leader>f :Files<CR>
nmap <leader><leader> :Buffers<CR>
let g:fzf_action = {
  \ 'ctrl-o': 'split',
  \ 'ctrl-v': 'vsplit' }

" netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  " ignore dotfiles by default
let g:netrw_localrmdir='rm -r'

" syntastic
nnoremap <leader>l :SyntasticCheck<CR>
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes':[], 'passive_filetypes': []}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" remove trailing spaces on save
autocmd FileType clojure,python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
