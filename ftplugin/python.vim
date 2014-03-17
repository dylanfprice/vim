" ropevim
let ropevim_enable_shortcuts = 0
let ropevim_goto_def_newwin = 0
let ropevim_vim_completion = 1
let ropevim_guess_project = 1
let g:ropevim_autoimport_modules = ['os', 'shutil', 'functools', 'datetime', 'django.*']
let g:pymode_breakpoint_bind = '<leader>pb'
map <c-i> :RopeAutoImport<CR>
nmap <leader>pd :RopeGotoDefinition<CR>
nmap <leader>po :RopeFindOccurrences<CR>
nmap <leader>pr :RopeRename<CR>

" Isort
nmap <leader>pi :Isort<CR>
let g:vim_isort_map = '<c-o>'

" python-mode
let g:pymode_rope = 0
"let g:pymode_rope_goto_definition_bind = '<C-]>'
"let g:pymode_rope_goto_definition_cmd = 'e'
"let g:pymode_rope_rename_bind = ',pr'
"let g:pymode_rope_complete_on_dot = 0

let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_ignore='E262,E261,E501,E1103,E1002,W0212,C0111,C0301,C1001,R0924'
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8'] "pylint
nmap <leader>pl :PymodeLint<CR>

" set up tags
set tags=$ENERGYSAVVY_DIR/optix-tags,$ENERGYSAVVY_DIR/package-tags
" tag completion
inoremap <c-x><c-]> <c-]>
nmap <leader>ps :TagSearch 
nmap <leader>pt :TagSearch <c-r><c-w><CR>

" Function to search tags
command! -nargs=1 TagSearch call s:TagSearch(<f-args>)
function! s:TagSearch(name)
  " Retrieve tags of the 'f' kind
  let tags = taglist('^'.a:name)
  "let tags = filter(tags, 'v:val["kind"] == "f"')

  " Prepare them for inserting in the quickfix window
  let qf_taglist = []
  for entry in tags
    call add(qf_taglist, {
          \ 'pattern':  entry['cmd'],
          \ 'filename': entry['filename'],
          \ })
  endfor

  " Place the tags in the quickfix window, if possible
  if len(qf_taglist) > 0
    call setqflist(qf_taglist)
    copen
  else
    echo "No tags found for ".a:name
  endif
endfunction
