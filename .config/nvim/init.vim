if &compatible
  set nocompatible
endif
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim-2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim-3/bin/python'
let s:dein_dir = "$HOME/.config/nvim/dein"
let s:dein_repo_url = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_repo_url

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_repo_url)

  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/deoplete.nvim', { 'on_i': 1 })
  call dein#add('fishbullet/deoplete-ruby', { 'on_ft': 'ruby' })
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tyru/caw.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('thinca/vim-ref')
  call dein#add('glidenote/memolist.vim')
  call dein#add('kannokanno/previm', { 'on_ft': 'markdown' })
  call dein#add('tyru/open-browser.vim', { 'on_ft': 'markdown' })

  call dein#add('vim-ruby/vim-ruby', { 'on_ft': 'ruby' })
  call dein#add('tpope/vim-rails', { 'on_ft': 'ruby' })
  call dein#add('tpope/vim-markdown', { 'on_ft': 'markdown' })
  call dein#add('jelera/vim-javascript-syntax', { 'on_ft': 'javascript' })
  call dein#add('hail2u/vim-css3-syntax', { 'on_ft': 'css' })
  call dein#add('slim-template/vim-slim', { 'on_ft': 'slim' })
  call dein#add('digitaltoad/vim-pug', { 'on_ft': 'pug' })

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
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" file format
set fileformats=unix,dos,mac

" Display line number.
set number

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
au FileType slim       setlocal sw=2 ts=2 sts=2
au FileType pug        setlocal sw=2 ts=2 sts=2
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
let g:deoplete#auto_complete_start_length = 1

" Move by tab
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" close by enter
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"

"------------------------------------------------
" denite.nvim
"------------------------------------------------

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')

nnoremap <silent> <C-k><C-f> :<C-u>Denite file_rec<CR>
nnoremap <silent> <C-k><C-u> :<C-u>Denite file_mru<CR>
nnoremap <silent> <C-k><C-g> :<C-u>Denite grep<CR>

"------------------------------------------------
" lightline.vim
"------------------------------------------------

let g:lightline = {
    \ 'colorscheme': 'darcula',
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
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . '' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'denite' ? denite#get_status_mode() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? ''._ : ''
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
" vim-markdown
"------------------------------------------------

nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

function! ToggleCheckbox()
  let l:line = getline('.')
  if l:line =~ '^\-\s\[\s\]'
    let l:result = substitute(l:line, '^-\s\[\s\]', '- [x]', '')
    call setline('.', l:result)
  elseif l:line =~ '^\-\s\[x\]'
    let l:result = substitute(l:line, '^-\s\[x\]', '- [ ]', '')
    call setline('.', l:result)
  end
endfunction

"------------------------------------------------
" previm
"------------------------------------------------

augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
