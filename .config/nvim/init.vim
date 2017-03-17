if &compatible
  set nocompatible
endif

let s:dein_dir = '~/.config/nvim/dein'
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

  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')

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

" Display line number.
set number

" Underline in current line.
set cursorline

" Always display status line.
set laststatus=2

" File name complete.
set wildmode=list,full

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

nnoremap + <C-a>
nnoremap - <C-x>
inoremap <C-c> <ESC>

"------------------------------------------------
" deoplete
"------------------------------------------------

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

" Move by tab
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"------------------------------------
" denite
"------------------------------------

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
" lightline
"------------------------------------------------

let g:lightline = {
    \ 'colorscheme': 'wombat',
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
" caw
"------------------------------------------------
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
