filetype off
filetype plugin indent off

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'slim-template/vim-slim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"------------------------------------
" 基本設定
"------------------------------------

" 構文ごとに色分け表示する
syntax on

" 行番号表示
set number

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

" 常にステータスラインを表示
set laststatus=2

" ファイルを保存しなくても、別ファイルが開けるように
set hidden

" カレント行に下線
set cursorline

" クリップボードを共有
set clipboard=unnamed,autoselect

"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

" 行末スペースを可視化する
set list
set listchars=trail:-

" 検索時に大文字小文字を区別しない
set ignorecase

" 検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase

" 検索語にマッチした単語をハイライトする
set hlsearch

" 検索履歴を50個残す
set history=50

" ウィンドウ幅で行を折り返す
set wrap
set display=lastline

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 2バイト文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" 保管メニュー高さ
set pumheight=10

" インクリメント・デクリメント設定
nnoremap + <C-a>
nnoremap - <C-x>

" beep音消す
set noerrorbells
set vb t_vb=

" インデント設定
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

au FileType html       setlocal sw=2 ts=2 sts=2
au FileType css        setlocal sw=2 ts=2 sts=2
au FileType javascript setlocal sw=4 ts=2 sts=2
au FileType markdown   setlocal sw=4 ts=4 sts=4
au FileType ruby       setlocal sw=2 ts=2 sts=2
au FileType haml       setlocal sw=2 ts=2 sts=2
au FileType less,sass  setlocal sw=2 ts=2 sts=2
au FileType yaml       setlocal sw=2 ts=2 sts=2

"------------------------------------
" neocomplcache
"------------------------------------

" 自動起動設定
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplcache_enable_smart_case = 1

" _区切りの保管を有効化 
let g:neocomplcache_enable_underbar_completion = 1

" キャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" neocomplcacheを自動的にロックするバッファ名のパターンを指定
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" ディクショナリを設定
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : ''
      \ }

" 前回行われた補完をキャンセル
inoremap <expr><C-g> neocomplcache#undo_completion()

" 補完候補のなかから、共通する部分を補完
inoremap <expr><C-l> neocomplcache#complete_common_string()

" ポップアップを削除
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"

" 選択している候補を確定
inoremap <expr><C-y> neocomplcache#close_popup()

" 選択している候補をキャンセルし、ポップアップを閉じる
inoremap <expr><C-e> neocomplcache#cancel_popup()

" Returnキーでポップアップを閉じる 
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" TAB移動できるようにする
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"------------------------------------
" unite
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

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"------------------------------------
" caw
"------------------------------------
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"------------------------------------
" lightline
"------------------------------------

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
