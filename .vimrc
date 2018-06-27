filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#rc()
Bundle 'VundleVim/Vundle.vim'
Bundle 'tomasr/molokai'
Bundle 'davidhalter/jedi-vim'  
Bundle 'node.js'
Bundle 'ervandew/supertab' 
Bundle 'vim-syntastic/syntastic'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-fugitive.git'
Bundle 'marvelfans/vim-neatstatus'
filetype on
" ============================================================ "

let mapleader=","
let g:mapleader=","

noremap ` :w!<cr>
noremap q :q!<cr>
noremap A ^oremap E $
noremap ; :
noremap <F1> <Nop>
nnoremap <space> za

map <C-j> <C-W><C-J>
map <C-k> <C-W><C-K>
map <C-h> <C-W><C-H>
map <C-l> <C-W><C-L>

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese,cp930,GBK

set nocompatible
set history=700
set so=3
set ruler
set wildmenu
set wildignore=*.0,*~,~.pyc
set cmdheight=1
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set hlsearch
set incsearch

set showmatch
set showmode
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has('clipboard')
    set clipboard=unnamed
endif

" code fold
" set fdm=indent

set mouse=c
set virtualedit=onemore
set modifiable
set viminfo^=%

set nobackup
set nowb
set noswapfile

set expandtab   " noexpandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set wrap

au BufNewFile,BufRead *.py\
       \ set tabstop=4
       \ set softtabstop=4
       \ set shiftwidth=4
       \ set textwidth=120
       \ set expandtab
       \ set autoindent
       \ set fileformat=unix

if exists("tags")
    set tags=./tags
endif

set laststatus=2
" set statusline+=\ %t
" set statusline+=\ [%{strftime(\"%Y/%m/%d\ %H:%M\")}]
" set statusline+=\ [%l,%c]

colorscheme molokai
set number
highlight lineNr cterm=NONE ctermfg=249 ctermbg=179 guifg=LightYellow guibg=Grey
set t_Co=256
set cursorline
highlight clear CursorLineNr
highlight clear LineNr
highlight clear SignColumn
set guifont=Courier_New:Bold:h14


syntax on
syntax enable
 
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"" Syntastic python
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_python_pylint_args='--max-line-length=120 --ignore=I100, I101, I201 --exclude=.git, __pycache__, build, dist'

"" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <Leader>e :NERDTreeToggle<CR>
map <F4> :NERDTreeToggle<CR>
