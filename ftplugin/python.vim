" Isort
nmap <leader>i :Isort<CR>
let g:vim_isort_map = '<c-o>'

let g:syntastic_python_checkers = ['flake8']

" python-mode
let g:pymode_rope = 1
let g:pymode_rope_autoimport = 0
let g:pymode_rope_goto_definition_bind = '[<C-D>'

let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_complete_on_dot = 0

let g:pymode_breakpoint_bind = '<leader>pb'
let g:pymode_lint = 0
