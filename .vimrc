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
set backspace=indent,eol,start

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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
call plug#end()

" vim-airline
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" colorscheme
set background=dark
autocmd ColorScheme * highlight MatchParen term=reverse cterm=bold ctermfg=231 ctermbg=60 gui=bold guifg=#ffffff guibg=#556779 
colorscheme hybrid

