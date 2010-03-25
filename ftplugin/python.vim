" Turn on syntax highlighting
syntax on

" Turn on line numbering
set number

" Always use spaces instead of tab chars
set expandtab

" More formatting and proper indentation for Python
set complete+=k~/.vim/syntax/python.vim isk+=.,(

" Pydiction complete-dict location
let g:pydiction_location="/home/dylan-price/.vim/pydiction-1.2/complete-dict"

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Debugging stuff
" TODO
" End Debugging Stuff




