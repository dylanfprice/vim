" Change colorscheme
set termguicolors
set background=light
colorscheme solarized8

" Allow setting syntax and stuff in modeline
set modeline

" Set wrap on and end at full words
set wrap
set linebreak

" Automatically save and load folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Don't abandon buffers when they are unloaded
set hidden

" Make TAB completion in command mode like a shell
set wildmode=list:longest

" Ignore case on / searches, but not on * searches
set ignorecase
set smartcase

" Don't highlight matches when searching
set nohlsearch

" Set the terminal title
set title

" Scroll before cursor hits very bottom to maintain more context
set scrolloff=3
" Once neovim updates to 0.4.4, shouldn't need this anymore.
autocmd TermOpen * setlocal scrolloff=0

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Less interruptive prompts
set shortmess=atI

" Set vimdiff colors to be nicer
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

" autocomplete behavior
set completeopt=menu,longest,preview
set omnifunc=syntaxcomplete#Complete
imap <buffer> <C-Space> <C-x><C-o>
imap <buffer> <C-@> <C-Space>

set wildignore+=*.pyc "ignore pyc files

set grepprg=rg\ --vimgrep\ --smart-case

" FZF settings
source /usr/share/doc/fzf/examples/fzf.vim
nnoremap <C-w>; :Buffers<CR>
nnoremap <C-w><C-;> :Buffers<CR>
nnoremap <C-w>' :Files<CR>
nnoremap <C-w><C-'> :Files<CR>
tnoremap <C-w>; <C-\><C-N>:Buffers<CR>
tnoremap <C-w><C-;> <C-\><C-N>:Buffers<CR>
tnoremap <C-w>' <C-\><C-N>:Files<CR>
tnoremap <C-w><C-'> <C-\><C-N>:Files<CR>
let g:fzf_action = {
  \ 'ctrl-o': 'split',
  \ 'ctrl-v': 'vsplit' }

" Terminal settings
tnoremap <C-w>: <C-\><C-N>:
nnoremap <C-w>: :
tnoremap <C-w> <C-\><C-N><C-w>
tnoremap <expr> <C-w><C-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
autocmd TermOpen * setlocal hidden
autocmd TermOpen * setlocal modifiable
autocmd TermOpen * setlocal modified
autocmd TermOpen * startinsert

" netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  " ignore dotfiles by default
let g:netrw_localrmdir = 'rm -r'

" coc.nvim
set tagfunc=CocTagFunc

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" gutentags
let g:gutentags_cache_dir = '~/.cache/gutentags/'

"" Python plugins
"" (that insist on global vars)

" poetv
let g:poetv_executables = ['poetry']
let g:poetv_auto_activate = 1
command! -bar -nargs=1 PoetvActivateDir
    \ :call setbufvar(bufname('%'), 'poetv_dir', '<args>') |
    \ :call poetv#activate()

" jedi
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#goto_command = "<C-]>"
let g:jedi#goto_assignments_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = ""
let g:jedi#smart_auto_mappings = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0

" python-syntax
let g:python_highlight_space_errors = 0

"" /Python plugins

" Autogenerate documentation tags
packloadall
silent! helptags ALL
