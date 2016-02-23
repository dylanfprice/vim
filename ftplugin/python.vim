" Isort
nmap <leader>i :Isort<CR>
let g:vim_isort_map = '<c-o>'

" python-mode
let g:pymode_rope = 1
let g:pymode_rope_autoimport = 0
let g:pymode_rope_goto_definition_bind = '<leader>pd'

let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_rename_bind = ',pr'
let g:pymode_rope_complete_on_dot = 0

let g:pymode_breakpoint_bind = '<leader>pb'

let g:pymode_rope_autoimport_modules = ['os.*', 'shutil', 'datetime.*', 'optix.*']
let g:pymode_rope_autoimport_import_after_complete = 0
map <c-i> :PymodeRopeAutoImport<CR>

let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_ignore='S101,E262,E261,E501,E1103,E1002,W0105,W0212,W0223,C0111,C0301,C1001,R0924,R0201'
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8'] "pylint
nmap <leader>pl :PymodeLint<CR>
