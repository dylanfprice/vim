nmap <leader>i :Isort<CR>

let g:syntastic_python_checkers = ['flake8']

set foldmethod=indent

set omnifunc=jedi#completions
nnoremap <silent> <buffer> ]<C-D> :call jedi#goto_assignments()<CR>
nnoremap <silent> <buffer> K :call jedi#show_documentation()<CR>
