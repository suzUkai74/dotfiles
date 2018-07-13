filetype off
filetype plugin indent off

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'dracula/vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails', { 'on_ft': 'ruby' }
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'slim-template/vim-slim'
NeoBundle "rcmdnk/vim-markdown"
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"------------------------------------
" Base
"------------------------------------

" syntax color
syntax on

" Color scheme
colorscheme dracula

" Encoding
set encoding=utf-8

" Write file encoding
set fileencoding=utf-8

" Read file encodings
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" Display line number.
set number

" file storage on vim
set wildmode=list,full

" share clipboard
set clipboard=unnamed,autoselect

" Underline in current line.
" set cursorline

" Always display status line.
set laststatus=2

" Visualize end-of-line space.
set list
set listchars=trail:-

" Wrap with window width.
set wrap
set display=lastline

" Split style.
set fillchars+=vert:\|
hi VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE

" 2 byte character adjustment.
set ambiwidth=double

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

" No limit short shape selection.
set virtualedit=block

" Timeout
set ttimeout
set ttimeoutlen=50

" terminal mode shell
set sh=zsh

" highlight
highlight Search cterm=NONE ctermfg=17 ctermbg=228 guifg=#282a36 guibg=#f1fa8c
highlight Pmenu ctermbg=61 guibg=#6272a4
highlight PmenuSel ctermbg=13 gui=undercurl guisp=Magenta
highlight CursorLine ctermbg=13 gui=undercurl guisp=Magenta
highlight Type ctermfg=117 guifg=#8be9fd


"------------------------------------------------
" Indent
"------------------------------------------------
"
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
au FileType markdown   setlocal sw=4 ts=4 sts=4
au FileType ruby       setlocal sw=2 ts=2 sts=2
au FileType haml       setlocal sw=2 ts=2 sts=2
au FileType slim       setlocal sw=2 ts=2 sts=2
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

"------------------------------------
" neocomplcache
"------------------------------------

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : ''
      \ }

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

"------------------------------------
" unite.vim
"------------------------------------

let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,ug  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"------------------------------------
" caw.vim
"------------------------------------

nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"------------------------------------
" lightline
"------------------------------------

let g:lightline = {
    \ 'colorscheme': 'Dracula',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' },
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
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
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

"------------------------------------
" vim-gitgutter
"------------------------------------

nnoremap <silent><C-g>  :<C-u>GitGutterToggle<CR>
nnoremap <silent><C-g>h :<C-u>GitGutterLineHighlightsToggle<CR>

"------------------------------------
" vim-filer
"------------------------------------

nnoremap <silent><C-e> :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>

"------------------------------------
" previm
"------------------------------------

augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

