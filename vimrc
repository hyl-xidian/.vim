""                                  _                    
""       _ __ ___  _   _     __   _(_)_ __ ___  _ __ ___ 
""      | '_ ` _ \| | | |____\ \ / / | '_ ` _ \| '__/ __|
""      | | | | | | |_| |_____\ V /| | | | | | | | | (__ 
""      |_| |_| |_|\__, |      \_/ |_|_| |_| |_|_|  \___|
""                 |___/                                 

runtime! archlinux.vim

"" LEADER key only take effect once
" define 'space' asLEADER key
let mapleader=" "
" space + enter means no high light, very useful!!!!
map <LEADER><CR> :nohlsearch<CR>

" press sapce twice to jump to the next '<++>' and edit it
" similiar as a place-holder
" combine with VISUAL motion
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

"" self keyboard mapping
noremap K 5k
noremap J 5j
map S :w<CR>
map s <nop>
map Q :q<CR>

"" split screen
" switch motion
nmap <LEADER>h <C-w>h
nmap <LEADER>l <C-w>l
nmap <LEADER>j <C-w>j
nmap <LEADER>k <C-w>k

"" tabs motion
" next tab page
nmap <LEADER><Tab> :tabnext<CR>
" create a new file in the cur dic
nmap <LEADER>n :tabnew<CR>

"" open the a file in the current dictionary
"nmap <LEADER>t :tabnew .<CR>
"" open a file in the new tab
"nmap <LEADER>d :tabfind ~/

"" ===
"" install plug
"" ===
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Error checking
Plug 'dense-analysis/ale'

"" Taglist
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" ranger.vim
Plug 'francoiscabrol/ranger.vim'

" coc code complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"vim table mode 
Plug 'dhruvasagar/vim-table-mode'

"vim markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"" Bookmarks
"Plug 'kshenoy/vim-signature'

call plug#end()

" set a colorscheme
let g:gruvbox_termcolors=256
let g:gruvbox_italic=1
set background=dark
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

" airline settings
let g:airline_theme='ayu_dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"" ===
"" file navigation settings
"" ===
" ranger.vim
let g:ranger_map_keys = 0
map <LEADER>o :Ranger<CR>
map <LEADER>f :RangerNewTab<CR>
""add this line if you use NERDTree
"let g:NERDTreeHijackNetrw = 0 
"" open ranger when vim open a directory
"let g:ranger_replace_netrw = 1 

"" ===
"" vim table mode for markdown
"" ===
map <LEADER>tm :TableModeToggle<CR>

"" tagbar 
"nmap <F8> :TagbarToggle<CR>

"" ===
"" vim markdown preview
"" ===
source $HOME/.vim/md-snippets.vim
map <LEADER>mp :MarkdownPreview<CR>
map <LEADER>ms :MarkdownPreviewStop<CR>

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

let g:mkdp_open_to_the_world = 0
let g:mkdp_browser = 'chromium'

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }

"" ===
"" vim signature
"" ===
"let g:SignatureMap = {
"        \ 'LEADER'             :  "m",
"        \ 'PlaceNextMark'      :  "m,",
"        \ 'ToggleMarkAtLine'   :  "m.",
"        \ 'PurgeMarksAtLine'   :  "dm-",
"        \ 'DeleteMark'         :  "dm",
"        \ 'PurgeMarks'         :  "dm/",
"        \ 'PurgeMarkers'       :  "dm?",
"        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
"        \ 'GotoPrevLineAlpha'  :  "",
"        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
"        \ 'GotoPrevSpotAlpha'  :  "",
"        \ 'GotoNextLineByPos'  :  "",
"        \ 'GotoPrevLineByPos'  :  "",
"        \ 'GotoNextSpotByPos'  :  "mn",
"        \ 'GotoPrevSpotByPos'  :  "mp",
"        \ 'GotoNextMarker'     :  "",
"        \ 'GotoPrevMarker'     :  "",
"        \ 'GotoNextMarkerAny'  :  "",
"        \ 'GotoPrevMarkerAny'  :  "",
"        \ 'ListLocalMarks'     :  "m/",
"        \ 'ListLocalMarkers'   :  "m?"
"        \ }


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

"" ===
"" fcitx control
"" when exiting from insert mode, the fcitx switches to en_US automatically
"" http://fcitx.github.io/handbook/chapter-remote.html
"" ===
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction

function! Fcitx2zh()
    let s:input_status = system("fcitx-remote")
    if s:input_status != 2 && g:input_toggle == 1
        let l:a = system("fcitx-remote -o")
        let g:input_toggle = 0
    endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
"" when entering in insert mode, switches to zh_CN automatically
"" default : close
"autocmd InsertEnter * call Fcitx2zh()

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