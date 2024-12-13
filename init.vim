" Change colorscheme
set termguicolors
set background=light
autocmd vimenter * ++nested colorscheme solarized8_flat

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

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Less interruptive prompts
set shortmess=atI

" autocomplete behavior
set completeopt=menu,longest,preview
set omnifunc=syntaxcomplete#Complete
imap <buffer> <C-Space> <C-x><C-o>
imap <buffer> <C-@> <C-Space>

set wildignore+=*.pyc "ignore pyc files

set grepprg=rg\ --vimgrep\ --smart-case

" vim-plug
call plug#begin()

Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'https://github.com/tpope/vim-vinegar.git'
Plug 'https://github.com/lifepillar/vim-solarized8.git', { 'branch': 'neovim' }
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/neoclide/coc.nvim.git', { 'branch': 'release' }
Plug 'https://github.com/nvim-treesitter/nvim-treesitter.git',  {'do': ':TSUpdate'}

call plug#end()

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
  \'ctrl-o': 'split',
  \'ctrl-v': 'vsplit' }

" Terminal settings
tnoremap <C-w>: <C-\><C-N>:
nnoremap <C-w>: :
tnoremap <C-w> <C-\><C-N><C-w>
tnoremap <expr> <C-w><C-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
autocmd TermOpen * setlocal hidden
autocmd TermOpen * setlocal modifiable
autocmd TermOpen * setlocal modified
autocmd TermOpen * startinsert
" Due to https://github.com/neovim/neovim/issues/3681, can't change cursor
" shape in term. Change the color so we at least can tell if we are in
" insert or normal mode within a terminal buffer.
highlight TermCursor guifg=#dc322f

" netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  " ignore dotfiles by default
let g:netrw_localrmdir = 'rm -r'

" coc.nvim
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-eslint',
  \'coc-json',
  \'coc-pyright',
  \'coc-tsserver',
  \'@yaegassy/coc-marksman',
\]

set tagfunc=CocTagFunc

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

nnoremap <silent> gd :CocDiagnostics<CR>

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


nnoremap <silent><nowait> go :call ToggleOutline()<CR>
function! ToggleOutline() abort
  let winid = coc#window#find('cocViewId', 'OUTLINE')
  if winid == -1
    call CocActionAsync('showOutline')
  else
    call coc#window#close(winid)
  endif
endfunction

command CocRename
    \ :call CocActionAsync('rename')
command CocReferences
    \ :call CocActionAsync('jumpReferences')

autocmd BufWritePre *.py call CocAction('runCommand', 'pyright.organizeimports')

" gutentags
let g:gutentags_cache_dir = '~/.cache/gutentags'

"" Python

" python-syntax
let g:python_highlight_space_errors = 0

"" /Python

" Autogenerate documentation tags
silent! helptags ALL
