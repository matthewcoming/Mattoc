set encoding=utf-8

au BufNewFile,BufRead *.py,*.cpp,*.h
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set shiftround |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

"au BufNewFile,BufRead *.cpp
"      \ set cindent |
"      \ set shiftwidth=4
au BufNewFile,BufRead *.js,*.html,*.css
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2

" commented out because of new header at bottom of vimrc
"au BufNewFile *.cpp 0r ~/mattoc/runtimeConfig/cpp.skel

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


" vim-header plugin

let g:header_field_filename = 1
let g:header_field_author = 'Matthew Coming'
let g:header_field_timestamp = 1
let g:header_field_modified_by = 0
let g:header_auto_add_header = 0

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  au BufNewFile *.h call InsertCppHeaderfileHeader()
  au BufNewFile *.cpp call InsertCppHeader()
  au BufWrite *.h,*.cpp call ModifyTime()
  " You might want to comment-out the line below - see note 6 at the end of the post.
  "au BufReadPost *.h call ModifyHeader()
endif

function! InsertCppHeaderfileHeader()
  call InsertSkeleton("h.skel") " CHANGE this!
  call InsertFname()
  1
  " Search for Description
  call search("Description:")
  normal! $
  startinsert
endfunction

function! InsertCppHeader()
  call InsertSkeleton("cpp.skel") " CHANGE this!
  1
  " Search for Description
  call search("Description:")
  normal! $
  startinsert
endfunction

function! InsertSkeleton(fname)
  let path_to_skeletons = $HOME . "/mattoc/runtimeConfig/" " CHANGE this!
  " Save cpoptions
  let cpoptions = &cpoptions
  " Remove the 'a' option - prevents the name of the
  " alternate file being overwritten with a :read command
  exe "set cpoptions=" . substitute(cpoptions, "a", "", "g")
  exe "read " . path_to_skeletons . a:fname
  " Restore cpoptions
  exe "set cpoptions=" . cpoptions
  " Delete the first line into the black-hole register
  1, 1 delete _
  " Search for Filename:
  call search("Filename:")
  exe "normal A " . expand("%:t")
  " Search for Created:
  let current_time = strftime("%b %d %Y %T") "CHANGE this!
  call search("Created:")
  exe "normal A " . current_time
  " Search for Last modified:
  call search("Last modified:")
  exe "normal A " . current_time

  " Search for Date
  "let date_line_no = search("Date")
  "let rev_history = getline(line("."))
  "let rev_history = substitute(rev_history, "Date ", strftime("%b %d %Y "), "") " CHANGE this!
  "let rev_history = substitute(rev_history, "Author", "Matthew Coming ", "") "CHANGE this!
  "let rev_history = substitute(rev_history, "Remarks", "File created.", "")
  "call append(date_line_no, rev_history)
endfunction

function! InsertFname()
  " Convert newname.h to _NEWNAME_H_
  let fname = expand("%:t")
  let cname = fname
  let fname = toupper(fname)
  let fname = substitute(fname, "\\.", "_", "g")
  " Search for #ifndef
  call search("#ifndef")
  exe "normal A " . "_" . fname . "_"
  " Search for #define
  call search("#define")
  exe "normal A " . "_" . fname . "_"

  let cname = substitute(cname, ".h", "", "g")
  " Search for class
  call search("class")
  exe "normal A " . cname . "{"
  exe "normal o"
  exe "normal o};"
endfunction

function! ModifyHeader()
  " Modify header only if we have write permissions
  if &readonly == 0
    " Search for Date
    let date_line_no = search("Date")
    if date_line_no != 0
      let rev_history = getline(line("."))
      " Substitute Date, and Author fields
      let rev_history = substitute(rev_history, "Date ", strftime("%b %d %Y "), "") " CHANGE this!
      let rev_history = substitute(rev_history, "Author", " ", "") " CHANGE this!
      let rev_history = substitute(rev_history, "Remarks", "", "")
      " echo "Modified = " . rev_history
      call append(date_line_no, rev_history)
      normal j$
      startinsert
    endif
  endif
endfunction

function! ModifyTime()
  " Do the updation only if the current buffer is modified
  if &modified == 1
    let current_time = strftime("%b %d %Y %X") " CHANGE this!
    " Save current position at mark i
    normal mi
    " Search for Last modified:
    let modified_line_no = search("Last modified:")
    if modified_line_no != 0 && modified_line_no < 10
      " There is a match in first 10 lines
      " Go to the : in modified: and replace the timestamp.
      exe "normal f:2l" . strlen(current_time) . "s" . current_time
      echo "Modified date stamp to " . current_time
      sleep 500m
      " Restore position
      normal `i
    endif
  endif
endfunction

