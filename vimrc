""                                  _                    
""       _ __ ___  _   _     __   _(_)_ __ ___  _ __ ___ 
""      | '_ ` _ \| | | |____\ \ / / | '_ ` _ \| '__/ __|
""      | | | | | | |_| |_____\ V /| | | | | | | | | (__ 
""      |_| |_| |_|\__, |      \_/ |_|_| |_| |_|_|  \___|
""                 |___/                                 

runtime! archlinux.vim

"" ===
"" Key Mapping
"" ===
source $HOME/.vim/key_mapping.vim
source $HOME/.vim/md-snippets.vim

"" ===
"" Plug Configuration
"" ===
source $HOME/.vim/plug_configuration.vim

set number
set relativenumber
set cul

set list
set listchars=tab:>-,trail:-
set laststatus=2
set ruler

set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" very useful
set backspace=indent,eol,start
" make cursor stay at the last position of last time
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set scrolloff=6

syntax on
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set undofile
set history=1000
set showcmd
set wildmenu
"set wildmode=longest:list,full
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set nocompatible
"set spell
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set autoread
