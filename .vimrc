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
set clipboard+=unnamed
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
if exists('$TMUX')
    let &t_SI = "\ePtmux;\e\e[5 q\e\\"	" 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_EI = "\ePtmux;\e\e[2 q\e\\"	" ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_SR = "\ePtmux;\e\e[4 q\e\\"	" 置換モード時に非点滅の下線タイプのカーソル
else
    let &t_SI .= "\e[5 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
endif

" mapping
nnoremap ; :
nnoremap : ;
nnoremap <S-j> 3j
nnoremap <S-k> 3k
vnoremap <S-j> 3j
vnoremap <S-k> 3k

"----------
" vim-plug
" ---------
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'luisjure/csound-vim'
    Plug 'kunstmusik/csound-repl'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'macguirerintoul/night_owl_light.vim'
    Plug 'github/copilot.vim'
call plug#end()

" ------------
" colorscheme
" ------------
if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" toggle background transparent
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

syntax enable
autocmd ColorScheme * highlight MatchParen term=reverse cterm=bold ctermfg=231 ctermbg=60 gui=bold guifg=#ffffff guibg=#556779
set background=dark
let g:enable_bold_font = 1
"colorscheme hybrid_reverse
"colorscheme hybrid_material
colorscheme night_owl_light

" Italic font
"let &t_ZH="\e[3m"
"let &t_ZR="\e[23m"
"highlight Comment cterm=italic

"-----------------
" Plugin settings
" ----------------
" vim-airline
let g:airline_theme='light'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" csound-vim
autocmd Syntax csound setlocal foldmethod=manual

" coc
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

:let end = search("^[ \t]*endin")
