"""" 插件
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#rc()
Bundle 'VundleVim/Vundle.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'davidhalter/jedi-vim'  
Bundle 'ervandew/supertab' 
Bundle 'vim-syntastic/syntastic'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/nerdtree'
Bundle 'plasticboy/vim-markdown'
Bundle 'Tagbar'
Bundle 'airblade/vim-gitgutter'
Bundle 'solarized'
Bundle 'iCyMind/NeoSolarized'
Bundle 'ctrlpvim/ctrlp.vim'
filetype on
" ============================================================ "
"""" 快捷键
let mapleader=","
let g:mapleader=","

noremap ` :w!<cr>
noremap q :q!<cr>
noremap A ^
noremap E $
noremap ; :
noremap <F1> <Nop>
noremap <F2> :vi #<cr>
nnoremap <space> za
" 在当前文件下搜索当前光标下的word，并跳转
noremap <silent><leader>ff   :vimgrep <C-R>=expand("<cword>")<CR> %<CR>:copen<cr>
" 在当前文件下搜索当前光标下的word，只是刷新quickfix
noremap <silent><leader>gg   :vimgrep <C-R>="/".expand("<cword>")."/j"<CR> %<CR>:cw<cr>

" 使用<C-g> 代替<Esc> 或 <C-[> 或 <C-c>
ino <C-g> <C-[>

" 使用pbcopy，方便对外部复制粘贴
vmap <F5> :w !pbcopy<cr><cr>
nmap <F6> :r !pbpaste<cr><cr>

map <C-j> <C-W><C-J>
map <C-k> <C-W><C-K>
map <C-h> <C-W><C-H>
map <C-l> <C-W><C-L>

"""" 编码设置
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese,cp930,GBK
set pastetoggle=<F9>
set nocompatible
set history=700
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

set laststatus=2
hi Comment cterm=italic
set number
highlight lineNr cterm=NONE ctermfg=249 ctermbg=179 guifg=LightYellow guibg=Grey
set t_Co=256
set cursorline
set cuc
highlight clear CursorLineNr
highlight clear LineNr
highlight clear SignColumn
set guifont=Monaco:h18
" 背景颜色无法刷新的情况
if &term =~ '256color'  
  set t_ut=  
endif  
let g:vim_markdown_folding_disabled = 1
syntax on
syntax enable
 
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"" tags
if exists('tags')
    set tags+=tags
    set autochdir
endif

"" Syntastic python
" 超过110个字符，背景就会变成红色，对python格试很有用
autocmd Filetype python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd Filetype python  match OverLength /\%121v.\+/
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set background=light
colorscheme solarized
let g:airline_theme='one'
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

"" ctrlp
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = 'find %s ! -regex ".*\.pyc"'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']
" " 关闭某些类型文件的自动补全
au FileType mail let b:delimitMate_autoclose = 0
set clipboard=unnamed
set runtimepath^=~/.vim/bundle/ag
