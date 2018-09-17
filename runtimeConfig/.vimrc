set encoding=utf-8

au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set shiftround |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

au BufNewFile,BufRead *.cpp
      \ set cindent |
      \ set shiftwidth=4
au BufNewFile,BufRead *.js,*.html,*.css
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2

set expandtab

set statusline=%t       "tail of the filename
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
" set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
" set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%{fugitive#statusline()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

execute pathogen#infect()
execute pathogen#helptags()

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_aggregate_errors = 1

let g:formatter_yapf_style = 'pep8'

filetype indent on
filetype plugin on

set showmatch
set foldmethod=indent
set foldlevel=99
set smarttab
set autoindent

noremap <F3> :Autoformat<CR>
noremap <F2> :lclose<CR>
noremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode

" set smartindent - turned off because it outdents octothorpe
" Below maps were to autocomplete the brace and move cursor between
" :inoremap { {}<Esc>i
" :inoremap ( ()<Esc>i
" :inoremap [ []<Esc>i
" :inoremap '' ''<Esc>i
" :inoremap "" ""<Esc>i
" :inoremap ' ''<Esc>i
" :inoremap " ""<Esc>i
" :inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

set ffs=unix

syntax on

colorscheme Tomorrow-Night-Eighties

autocmd bufnewfile,bufread *.c
        \ set cindent
let g:ale_set_highlights = 0

