" also see after/ftplugin/python.vim

nmap <leader>i :Isort<CR>

let g:syntastic_python_checkers = ['flake8']

set foldmethod=indent

let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "]<C-D>"
let g:jedi#documentation_command = "K"
let g:jedi#show_call_signatures = "2"
