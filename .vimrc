" Turn on plugins
syntax on
filetype plugin indent on

" Change colorscheme
"colorscheme slate

" Set tabs to be 4 spaces wide
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab

" Set wrap on and end at full words
set wrap
set linebreak

" Set line width to be 80
set tw=80

" Map <Ctrl>-F to <Esc>
imap  <Esc>

" Settings for VimClojure
let g:clj_highlight_builtins=1 "Highlight
let g:clj_paren_rainbow=1 "Rainbow parentheses

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif 
