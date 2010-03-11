" Turn on syntax highlighting
syntax on

" Turn on line numbering
set number

" Size of a hard tabstop
set tabstop=4

" Size of an indent
set shiftwidth=4

" A combination of spaces and tabs are used to simulate the tab stops at a
" width other than the hard tabstop
set softtabstop=4

" Make tab insert indents instead of tabs at the beginning of a line
set smarttab

" Always use spaces instead of tab chars
set expandtab

" Toggle line numbers and fold column for easy copying
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" More formatting and proper indentation for Python
set complete+=k~/.vim/syntax/python.vim isk+=.,(

 "Taglist variables
		 " Display function name in status bar:
		 let g:ctags_statusline=1
		 " Automatically start script
		 let generate_tags=1
		 " Displays taglist results in a vertical window:
		 let Tlist_Use_Horiz_Window=0
		 " Shorter commands to toggle Taglist display
		 nnoremap TT :TlistToggle<CR>
		 map <F4> :TlistToggle<CR>
		 " Various Taglist diplay config:
		 let Tlist_Use_Right_Window = 1
		 let Tlist_Compact_Format = 1
		 let Tlist_Exit_OnlyWindow = 1
		 let Tlist_GainFocus_On_ToggleOpen = 1
		 let Tlist_File_Fold_Auto_Close = 1

" Pydiction complete-dict location
let g:pydiction_location="/home/dylan-price/.vim/pydiction-1.2/complete-dict"

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Debugging stuff
" TODO
" End Debugging Stuff




