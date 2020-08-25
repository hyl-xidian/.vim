runtime! archlinux.vim


""leader key only take effect once 
""switch the leader key to 'space '
let mapleader=" "
""space + enter means no high light, very useful!!!!
map <LEADER><CR> : nohlsearch<CR>

" press sapce twice to jump to the next '<++>' and edit it
" similiar as a place-holder
" combine with VISUAL motion
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i


noremap K 5k
noremap J 5j
map S :w<CR>
map s <nop>
map Q :q<CR>

""spilt screen
" switch 
nmap <LEADER>h <C-w>h
nmap <LEADER>l <C-w>l
nmap <LEADER>j <C-w>j
nmap <LEADER>k <C-w>k


"" tabs motion
"next tab
nmap <LEADER><Tab> :tabnext<CR>
" touch a new file in the cur dic
nmap <LEADER>n :tabnew<CR>

""
""open the a file in the current dictionary
""nmap <LEADER>t :tabnew .<CR>

" open a file in the new tab
"nmap <LEADER>d :tabfind ~/


"" install plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" File navigation
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Error checking
Plug 'dense-analysis/ale'

"" Taglist
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" ranger.vim
Plug 'francoiscabrol/ranger.vim'

" coc code complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Bookmarks
Plug 'kshenoy/vim-signature'

call plug#end()

""set a scheme
let g:gruvbox_termcolors=256
let g:gruvbox_italic=1
set background=dark
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

"" airline settings
let g:airline_theme='ayu_dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


"" ===
"" file navigation settings
"" ===

" nerdtree
map <LEADER>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
"autocmd vimenter * NERDTree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"" tagbar 
"nmap <F8> :TagbarToggle<CR>

" ranger.vim
let g:ranger_map_keys = 0
map <leader>o :Ranger<CR>
map <leader>f :RangerNewTab<CR>

""add this line if you use NERDTree
"let g:NERDTreeHijackNetrw = 0 
"" open ranger when vim open a directory
"let g:ranger_replace_netrw = 1 
"


" vim signature
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


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

" very useful !!!!!! 
set backspace=indent,eol,start
" make cursor show up in the last status
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set scrolloff=6

set showmatch
syntax on
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
