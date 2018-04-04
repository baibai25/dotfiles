"------------------------------------------
" vim settings
" -----------------------------------------

" common settings
set nocompatible
set encoding=utf-8
scriptencoding utf-8
set number  " 行番号を表示
set cursorline  " カーソルラインをハイライト
set showmatch   " 対応する括弧を強調
set matchtime=1 " 対応括弧表示を1秒に
set matchpairs& matchpairs+=<:> " <>を対応括弧ペアに
set nostartofline   " 移動コマンドを使った時行頭に移動しない
set mouse=a "マウスモード有効
set whichwrap=b,s,<,>,[,]   " 行頭行末の左右移動で行をまたぐ
set clipboard=unnamedplus   "クリップボードと同期
set ambiwidth=double    " 全角記号の位置ずれ対策

" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" search
set incsearch   " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase  " 検索パターンに大文字小文字を区別しない
set smartcase   " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch    " 検索結果をハイライト
set wrapscan    " 最後尾まで検索を終えたら次の検索で先頭に移る
nnoremap <ESC><ESC> :nohlsearch<CR>  " ESCキー2度押しでハイライトの切り替え

" statusline
set statusline=%F   " ファイル名表示
set statusline+=%m  " 変更チェック表示
set statusline+=%r  " 読み込み専用かどうか表示
set statusline+=%h  " ヘルプページなら[HELP]と表示
set statusline+=%w  " プレビューウインドウなら[Prevew]と表示
set statusline+=%=  " これ以降は右寄せ表示
set statusline+=[ENC=%{&fileencoding}]  " file encoding
set statusline+=[LOW=%l/%L] " 現在行数/全行数
set laststatus=2    " ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)

" cursor
if has('vim_starting')
    let &t_SI .= "\e[5 q"   " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_EI .= "\e[2 q"   " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_SR .= "\e[4 q"   " 置換モード時に非点滅の下線タイプのカーソル
endif

"------------------------------------------
" vim-plug
" -----------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'w0ng/vim-hybrid'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neocomplete.vim'
Plug 'luisjure/csound-vim'
"Plug 'jiangmiao/auto-pairs'
call plug#end()

" colorscheme
set background=dark
autocmd ColorScheme * highlight MatchParen term=reverse cterm=bold ctermfg=231 ctermbg=60 gui=bold guifg=#ffffff guibg=#556779 
colorscheme hybrid

" neocomplete setting
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
