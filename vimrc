""                                  _                    
""       _ __ ___  _   _     __   _(_)_ __ ___  _ __ ___ 
""      | '_ ` _ \| | | |____\ \ / / | '_ ` _ \| '__/ __|
""      | | | | | | |_| |_____\ V /| | | | | | | | | (__ 
""      |_| |_| |_|\__, |      \_/ |_|_| |_| |_|_|  \___|
""                 |___/                                 

runtime! archlinux.vim

color molokai

"" ===
"" Key Mapping
"" ===
source $HOME/.vim/basic_func/key_mapping.vim


"" ===
"" Snippets
"' ===
source $HOME/.vim/basic_func/md_snippets.vim
source $HOME/.vim/basic_func/c++_snippets.vim


"" ===
"" File Navigation
"" ===
source $HOME/.vim/basic_func/ranger.vim
let g:ranger_map_keys = 0
""map <LEADER>o :Ranger<CR>
map <LEADER>o :RangerNewTab<CR>
""add this line if you use NERDTree
"let g:NERDTreeHijackNetrw = 0
"" open ranger when vim open a directory
"let g:ranger_replace_netrw = 1


"" ===
"" Git status
"" ===
source $HOME/.vim/basic_func/gitgutter.vim
set updatetime=100
" remove the limits of the size of signs
let g:gitgutter_max_signs = -1
" make background colours match the sign column
let g:gitgutter_set_sign_backgrounds = 1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


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

"function! Fcitx2zh()
"    let s:input_status = system("fcitx-remote")
"    if s:input_status != 2 && g:input_toggle == 1
"        let l:a = system("fcitx-remote -o")
"        let g:input_toggle = 0
"    endif
"endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
"" when entering in insert mode, switches to zh_CN automatically
"" default : close
"autocmd InsertEnter * call Fcitx2zh()


"" ===
"" Plug Configuration
"" ===
source $HOME/.vim/basic_func/plug_configuration.vim


" Search down into subfolders
" Provides tab-completion for all file -related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" ===
" TAG JUMPING:

" Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - ^ means <Ctrl>
" - Use ^] to jump under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" ===
" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" ===
" SNIPPETS:
" Example:
" C++ for_
" This tricks can be used with placeholder--"<++>"

" nnoremap ,for :-1read$HOME/.vim/code-snippets/c++_for_.snippets<CR>

" more snippets are difined in c++_snippets.vim

" NOW WE CAN:
" take over the world!
" (with fewer keystrokes)

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
"set wildmode=longest:list,full
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set nocompatible
"set spell
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set autoread
