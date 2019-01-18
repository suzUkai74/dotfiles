if &compatible
  set nocompatible
endif

let g:python_host_prog = $PYENV_ROOT . '/versions/neovim-2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim-3/bin/python'
let s:dein_dir = $HOME . '/.config/nvim/dein'
let s:dein_repo_url = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_repo_url

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_repo_url)
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/vimshell')
  call dein#add('Shougo/deoplete.nvim', { 'on_i': 1 })
  " call dein#add('autozimu/LanguageClient-neovim', { 'rev': 'next', 'build': 'bash install.sh', })
  call dein#add('tbodt/deoplete-tabnine', { 'build': 'bash install.sh' })
  " call dein#add('uplus/deoplete-solargraph', { 'on_ft': 'ruby' })
  " call dein#add('fishbullet/deoplete-ruby', { 'on_ft': 'ruby' })
  call dein#add('zchee/deoplete-jedi', { 'on_ft': 'python' })
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim', { 'on_ft': 'snippet' })
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('ozelentok/denite-gtags')
  call dein#add('szw/vim-tags')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  " call dein#add('w0rp/ale')
  call dein#add('tyru/caw.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('thinca/vim-ref')
  call dein#add('glidenote/memolist.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('kannokanno/previm', { 'on_ft': 'markdown' })
  call dein#add('tyru/open-browser.vim', { 'on_ft': 'markdown' })

  call dein#add('vim-ruby/vim-ruby', { 'on_ft': 'ruby' })
  call dein#add('tpope/vim-rails', { 'on_ft': 'ruby' })
  " call dein#add('todesking/ruby_hl_lvar.vim', { 'on_ft': 'ruby' })
  call dein#add('tpope/vim-markdown', { 'on_ft': 'markdown' })
  call dein#add('jelera/vim-javascript-syntax', { 'on_ft': 'javascript' })
  call dein#add('hail2u/vim-css3-syntax', { 'on_ft': 'css' })
  call dein#add('slim-template/vim-slim', { 'on_ft': 'slim' })
  call dein#add('digitaltoad/vim-pug', { 'on_ft': 'pug' })
  call dein#add('bumaociyuan/vim-swift', { 'on_ft': 'swift' })

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

" no swap
set noswapfile

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

" Split direction
set splitright

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

" Cursol speed up
set lazyredraw
set ttyfast

" update swap
set updatetime=250

" wild ignore file type
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png        " image
set wildignore+=*.swp,*.swo,*.swn                     " vim
set wildignore+=.Gemfile.lock.tags,GPATH,GTAGS,GRTAGS " tags

" highlight
highlight CursorLine ctermbg=13 gui=undercurl guisp=Magenta
highlight Identifier ctermfg=215 gui=italic guifg=#ffb86c
highlight Pmenu ctermbg=61 guibg=#6272a4
highlight PmenuSel ctermbg=13 gui=undercurl guisp=Magenta
highlight Search cterm=NONE ctermfg=17 ctermbg=228 guifg=#282a36 guibg=#f1fa8c

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
au FileType python     setlocal sw=4 ts=4 sts=4
au FileType php        setlocal sw=4 ts=4 sts=4
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
let g:deoplete#sources#jedi#enable_typeinfo = 0

" Move by tab
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" close by enter
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"

"------------------------------------------------
" LanguageClient-neovim
"------------------------------------------------

" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"   \ 'ruby': ['solargraph', 'stdio']
" \ }
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"------------------------------------------------
" denite.nvim
"------------------------------------------------

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>')

nnoremap <silent> <C-k><C-f> :<C-u>Denite file_rec<CR>
nnoremap <silent> <C-k><C-u> :<C-u>Denite file_mru<CR>
nnoremap <silent> <C-k><C-g> :<C-u>Denite grep<CR>
nnoremap <silent> <C-k><C-o> :<C-u>Denite outline -highlight-mode-insert=Search<CR>

"------------------------------------------------
" denite-gtags
"------------------------------------------------

nnoremap <silent> <C-j><C-a> :DeniteCursorWord -buffer-name=gtags_context gtags_context<cr>
nnoremap <silent> <C-j><C-d> :DeniteCursorWord -buffer-name=gtags_def gtags_def<cr>
nnoremap <silent> <C-j><C-r> :DeniteCursorWord -buffer-name=gtags_ref gtags_ref<cr>
nnoremap <silent> <C-j><C-g> :DeniteCursorWord -buffer-name=gtags_grep gtags_grep<cr>

"------------------------------------------------
" vim-tags
"------------------------------------------------

set tags+=.Gemfile.lock.tags
nnoremap <C-]> g<C-]> 

"------------------------------------------------
" ale
"------------------------------------------------

" let g:ale_linters = {
"     \ 'javascript': ['eslint'],
"   \ }
" let g:ale_sign_error = '!!'
" let g:ale_sign_warning = '=='

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
      \ 'fugitive': 'MyFugitive',
      \ 'readonly': 'MyReadonly',
      \ 'modified': 'MyModified',
      \ 'filename': 'MyFilename',
      \ 'fileformat': 'MyFileformat',
      \ 'filetype': 'MyFiletype',
      \ 'fileencoding': 'MyFileencoding',
      \ 'mode': 'MyMode'
    \ }
  \ }

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
" vim-gitgutter
"------------------------------------------------

if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

nnoremap <Leader>ht :GitGutterLineHighlightsToggle<CR>

"------------------------------------
" defx
"------------------------------------

nnoremap <silent> <Leader>f :Defx -split=vertical -winwidth=50 -direction=topleft<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
 " Define mappings
  nnoremap <silent><buffer><expr> <CR>
 \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> c
 \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
 \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
 \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
 \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o
 \ defx#do_action('open')
  nnoremap <silent><buffer><expr> P
 \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K
 \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
 \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
 \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
 \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> x
 \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
 \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
 \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h
 \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
 \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
 \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
 \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
 \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
 \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
 \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
 \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
 \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
 \ defx#do_action('change_vim_cwd')
endfunction

"------------------------------------------------
" vim-ref
"------------------------------------------------

let g:ref_refe_cmd = $HOME . '/.rbenv/shims/refe'

"-----------------------------------------------u
" caw.vim
"------------------------------------------------

let g:caw_hatpos_skip_blank_line = 0
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
" quickrun-vim
"------------------------------------------------

let g:quickrun_config = {
  \ "_" : {
  \   "runner" : "vimproc",
  \   "runner/vimproc/updatetime" : 40,
      \ }
  \ }

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
