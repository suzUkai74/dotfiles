if &compatible
  set nocompatible
endif

let s:dein_dir = "$HOME/.config/nvim/dein"
let s:dein_repo_url = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_repo_url

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_repo_url)

  call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('itchyny/lightline.vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tyru/caw.vim')
  call dein#add('rking/ag.vim')
  call dein#add('glidenote/memolist.vim')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')

  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-markdown')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('hail2u/vim-css3-syntax')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"------------------------------------------------
" Base
"------------------------------------------------

" Color scheme
colorscheme dracula

" Encoding
set encoding=utf-8

" Write file encoding
set fileencoding=utf-8

" Read file encodings
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" Display line number.
set number

" Underline in current line.
set cursorline

" Always display status line.
set laststatus=2

" Visualize end-of-line space.
set list
set listchars=trail:-

" Wrap with window width.
set wrap
set display=lastline

" 2 byte character adjustment.
set ambiwidth=double

" Split style.
set fillchars+=vert:\|
hi VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE

" Complement menu height.
set pumheight=20

" No backspace limit.
set backspace=indent,eol,start

" Scroll with margins.
set scrolloff=8

" Open another file without saving.
set hidden

" Reread the changed file.
set autoread

" Invalid beep sound.
set noerrorbells
set vb t_vb=

" Timeout config.
set timeout timeoutlen=1000 ttimeoutlen=50

" Highlight matched words.
set hlsearch

" Incremental search.
set incsearch

" Not case sensitive.
set ignorecase

" Distinguish capital letters if search words with uppercase letters.
set smartcase

" Command line history.
set history=50

" Replacement g option default.
set gdefault

" Share clipboard.
set clipboard=unnamed,unnamedplus

" No limit short shape selection.
set virtualedit=block

"------------------------------------------------
" Indent
"------------------------------------------------

set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

au FileType html       setlocal sw=2 ts=2 sts=2
au FileType css        setlocal sw=2 ts=2 sts=2
au FileType javascript setlocal sw=2 ts=2 sts=2
au FileType markdown   setlocal sw=2 ts=2 sts=2
au FileType ruby       setlocal sw=2 ts=2 sts=2
au FileType haml       setlocal sw=2 ts=2 sts=2
au FileType less,sass  setlocal sw=2 ts=2 sts=2
au FileType yaml       setlocal sw=2 ts=2 sts=2
au FileType vim        setlocal sw=2 ts=2 sts=2
au FileType zsh        setlocal sw=2 ts=2 sts=2

"------------------------------------------------
" Key Binding
"------------------------------------------------

noremap <C-a> ^
noremap <C-e> $
nnoremap + <C-a>
nnoremap - <C-x>
inoremap <C-c> <ESC>

"------------------------------------------------
" deoplete.nvim
"------------------------------------------------

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0


" Move by tab
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" close by enter
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"

"------------------------------------------------
" denite.nvim
"------------------------------------------------

call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'default_opts', ['--nocolor', '--nogroup'])

nnoremap <silent> <C-k><C-f> :<C-u>Denite file_rec<CR>
nnoremap <silent> <C-k><C-u> :<C-u>Denite file_mru<CR>
nnoremap <silent> <C-k><C-g> :<C-u>Denite grep<CR>

"------------------------------------------------
" lightline.vim
"------------------------------------------------
let g:lightline_colors_name = 'dracula'

if g:lightline_colors_name == 'dracula'
  let s:black          = [ '#1c1c1c', 234 ]
  let s:dark_gray      = [ '#262626', 235 ]
  let s:gray           = [ '#3a3a3a', 237 ]
  let s:light_gray     = [ '#4e4e4e', 239 ]
  let s:white          = [ '#dadada', 253 ]
  let s:dark_blue_gray = [ '#6272a4', 60  ]
  let s:purple         = [ '#bd93f9', 141 ]
  let s:pink           = [ '#ff79c6', 212 ]
  let s:yellow         = [ '#f1fa8c', 228 ]
  let s:orange         = [ '#ffb86c', 228 ]

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left     = [ [ s:white, s:dark_blue_gray], [s:white, s:gray ] ]
  let s:p.normal.right    = [ [ s:white, s:dark_blue_gray], [s:white, s:gray ] ]
  let s:p.inactive.left   = [ [ s:white, s:gray], [s:white, s:gray ] ]
  let s:p.inactive.right  = [ [ s:white, s:gray], [s:white, s:gray ] ]
  let s:p.insert.left     = [ [ s:black, s:purple], [s:purple, s:gray ] ]
  let s:p.insert.right    = [ [ s:black, s:purple], [s:purple, s:gray ] ]
  let s:p.replace.left    = [ [ s:black, s:yellow], [s:yellow, s:gray ] ]
  let s:p.replace.right   = [ [ s:black, s:yellow], [s:yellow, s:gray ] ]
  let s:p.visual.left     = [ [ s:black, s:pink], [s:pink, s:gray ] ]
  let s:p.visual.right    = [ [ s:black, s:pink], [s:pink, s:gray ] ]
  let s:p.normal.middle   = [ [ s:white, s:dark_gray ] ]
  let s:p.inactive.middle = [ [ s:white, s:dark_gray ] ]
  let s:p.tabline.left    = [ [ s:white, s:light_gray ] ]
  let s:p.tabline.tabsel  = [ [ s:white, s:dark_blue_gray ] ]
  let s:p.tabline.middle  = [ [ s:white, s:gray ] ]
  let s:p.tabline.right   = [ [ s:white, s:dark_gray ] ]
  let s:p.normal.error    = [ [ s:black, s:orange ] ]
  let s:p.normal.warning  = [ [ s:black, s:orange ] ]
  let g:lightline#colorscheme#dracula#palette = lightline#colorscheme#flatten(s:p)

  highlight Search cterm=NONE ctermfg=17 ctermbg=228 guifg=#282a36 guibg=#f1fa8c
endif

let g:lightline = {
    \ 'colorscheme': g:lightline_colors_name,
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'separator': { 'left': '⮀', 'right': '⮂' },
    \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
    \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode'
      \}
      \}

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'denite' ? denite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"------------------------------------------------
" caw.vim
"------------------------------------------------
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"------------------------------------------------
" memolist.vim
"------------------------------------------------
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>

" suffix type
let g:memolist_memo_suffix = "md"

" use denite
let g:memolist_denite = 1

"------------------------------------------------
" previm
"------------------------------------------------
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
