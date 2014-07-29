" Isort
nmap <leader>pi :Isort<CR>
let g:vim_isort_map = '<c-o>'

" python-mode
let g:pymode_rope = 1
let g:pymode_rope_goto_definition_bind = '<leader>pd'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_rename_bind = ',pr'
let g:pymode_rope_complete_on_dot = 0

let g:pymode_breakpoint_bind = '<leader>pb'

let g:pymode_rope_autoimport_modules = ['os.*', 'shutil', 'datetime.*', 'optix.*']
let g:pymode_rope_autoimport_import_after_complete = 0
map <c-i> :PymodeRopeAutoImport<CR>

let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_ignore='S101,E262,E261,E501,E1103,E1002,W0212,W0223,C0111,C0301,C1001,R0924'
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8'] "pylint
nmap <leader>pl :PymodeLint<CR>

" set up tags
set tags=$ENERGYSAVVY_DIR/package-tags,$ENERGYSAVVY_DIR/optix-tags
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
