filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""""
"basic settings
""""""""""""""""""""""""""""""""""""
set autoread
set shortmess=atI
set autochdir
set hlsearch
set incsearch
set mouse-=a
set title
set visualbell t_vb=
set noerrorbells
set nobackup
set noswapfile
set magic
set nu
set showcmd
set showmode
set showmatch
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4 "退格空格数
set expandtab
set smarttab
set shiftround

"set nowrapscan
set helplang=cn
set ffs=unix,dos,mac
setlocal omnifunc=syntaxcomplete#Complete
set completeopt=longest,menu "set autocomplete menu
set wildmenu
set wildignore=*.o,*~,*.pyc,*.class
set modeline
set laststatus=2
set history=1000
set undolevels=1000
set nornu
set cursorline
set nofoldenable
"set foldmethod=manual
set spell spelllang=en_gb

""""""""""""""""""""""""""""""""""""
"encoding
""""""""""""""""""""""""""""""""""""
if (has("win32")|| has("win64"))
    set encoding=gbk
    set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,latin1
    set termencoding=gbk
else
    set encoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,latin1
    set termencoding=utf-8
endif

""""""""""""""""""""""""""""""""""""
"gui
""""""""""""""""""""""""""""""""""""
"m = menu T=toolbar r=right scroll L=left scroll
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
endif

""""""""""""""""""""""""""""""""""""
"baisc keymap
""""""""""""""""""""""""""""""""""""
let mapleader=","

set pastetoggle=<F12>

nnoremap ; :
inoremap <C-e> <ESC>A
inoremap <C-a> <ESC>I
inoremap <C-d> <ESC>lxi
inoremap <C-f> <ESC>lli
inoremap <C-w> <ESC>bcw
inoremap <C-h> <ESC>xi

inoremap <C-c> <ESC>:q!<CR>
nnoremap <C-c> <ESC>:q!<CR>
cnoremap <C-c> <ESC>:q!<CR>
vnoremap <C-c> <ESC>:q!<CR>
snoremap <C-c> <ESC>:q!<CR>
nmap <a-j> <c-w>w<c-e><c-w>w
nmap <a-k> <c-w>w<c-y><c-w>w

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-e> <C-w><C-w>

"for long line just move one row
noremap j gj
noremap k gk

map :W :w

nmap <silent><leader>/ :nohlsearch<CR>

function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

cmap w!! w !sudo tee % > /dev/null

""""""""""""""""""""""""
"colorscheme
""""""""""""""""""""""""
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""
"misc
""""""""""""""""""""""""""""""""""""
:au BufEnter,BufWinEnter,CursorHold * checktime
autocmd BufWritePre * :%s/\s\+$//e

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

noremap X 4x
"| set list |

:iab <expr> dts strftime("%Y-%m-%d %H:%M:%S")
