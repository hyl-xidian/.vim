""                                  _                    
""       _ __ ___  _   _     __   _(_)_ __ ___  _ __ ___ 
""      | '_ ` _ \| | | |____\ \ / / | '_ ` _ \| '__/ __|
""      | | | | | | |_| |_____\ V /| | | | | | | | | (__ 
""      |_| |_| |_|\__, |      \_/ |_|_| |_| |_|_|  \___|
""                 |___/                                 

"color koehler
color molokai

autocmd Filetype markdown source $HOME/.vim/plug_configuration.vim

" Key Mappings {{{
" Basic Mappings {{{
"" ===
"" === Basic Mappings
"" ===
" define 'space' as LEADER key
let mapleader=" "

" press SPACE twice to jump to the next '<++>' and edit it
" as similiar as a place-holder
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" space + enter means no high light, very useful!!!!
map <LEADER><CR> :nohlsearch<CR>

" copy/paste to the System clipboard
vnoremap <LEADER>y "+y
inoremap <LEADER>p <Esc>"+p
"" ctrl + ;
"" open a memu to select contents from history system clipboard
"" <Tab> to switch around results
"" <Space> to paste the chosen contents

" Faster save and quit
map S :w<CR>
map Q :q<CR>
"}}}

" Cursor Movement {{{
"" ===
"" === Cursor Movement
"" ===
" Faster in-line navigation
noremap K 5k
noremap J 5j

" Copy from the cursor location to the end of the line
nnoremap Y y$

" 9 key: go to the start of the current line
" 0 key: go to the end of the current line
noremap <silent> 9 0
noremap <silent> 0 $
"}}}

" Command Mode Cursor Movement {{{
"" ===
"" === Command Mode Cursor Movement
"" ===
cnoremap <C-h> <Left>
cnoremap <C-l> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
"}}}

" Window Management {{{
"" ===
"" === Window Management
"" ===
" Use <space> + new arrow keys for moving the cursor around windows
nmap <LEADER>h <C-w>h
nmap <LEADER>l <C-w>l
nmap <LEADER>j <C-w>j
nmap <LEADER>k <C-w>k

" Disable the default s key
map s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical) and open a new file with ranger
noremap ok :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>:Ranger<CR>
noremap oj :set splitbelow<CR>:split<CR>:Ranger<CR>
noremap oh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>:Ranger<CR>
noremap ol :set splitright<CR>:vsplit<CR>:Ranger<CR>

" Resize splits with arrow keys
noremap <up> :res -5<CR>
noremap <down> :res +5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>
"}}}

" Tab Management {{{
"" ===
"" === Tab Management
"" ===
" move around tabs with 'th' and 'tl'
nmap tl :+tabnext<CR>
nmap th :-tabnext<CR>
" open a new tab
nmap tn :tabnew<CR>
"}}}

" Buffer Management {{{

"" :ls b --Show all exited buffers
"" :b NUM --Specify the NUMth buffer
" Buffer Previous
nnoremap bh :bp<CR>
" Buffer Next
nnoremap bl :bn<CR>
" Buffer Down --Shutdown the current buffer
nnoremap bd :bd<CR>
"}}}
"}}}

" Snippets {{{
" Markdown Snippets {{{
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
"autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,n - [ ] 
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
"}}}

" C++ Snippets {{{
autocmd Filetype cpp,c,h nnoremap <buffer> ,for :-1read$HOME/.vim/code-snippets/c++_for_.snippets<CR>
"}}}
"}}}

" Useful Functions {{{
" File Navigation {{{
"" ===
"" File Navigation
"" ===
function! OpenRangerIn(path, edit_cmd)
    let currentPath = expand(a:path)
    if isdirectory(currentPath)
      silent exec '!' . 'ranger' . ' --choosefiles=' . '/tmp/chosenfile' . ' "' . currentPath . '"'
    else
      silent exec '!' . 'ranger' . ' --choosefiles=' . '/tmp/chosenfile' . ' --selectfile="' . currentPath . '"'
    endif
    if filereadable('/tmp/chosenfile')
      for f in readfile('/tmp/chosenfile')
        exec a:edit_cmd . f
      endfor
      call delete('/tmp/chosenfile')
    endif
    redraw!
    " reset the filetype to fix the issue that happens
    " when opening ranger on VimEnter (with `vim .`)
    filetype detect
  endfun

command! RangerCurrentFile call OpenRangerIn("%", 'edit ')
command! Ranger RangerCurrentFile

command! RangerCurrentDirectoryNewTab call OpenRangerIn("%:p:h", 'tabedit ')
command! RangerNewTab RangerCurrentDirectoryNewTab

map <LEADER>f :Ranger<CR>
map <LEADER>o :RangerNewTab<CR>
"}}}

" Fcitx Control {{{
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

"" when entering in insert mode, switches to zh_CN automatically
"" default : close
"autocmd InsertEnter * call Fcitx2zh()

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()

"}}}

" CompileRunGcc {{{
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:term ./%<
        :res -10
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

noremap <C-r> :call CompileRunGcc()<CR>
"}}}

" Git-Branch Name {{{
"" ===
"" === Get the name of git branch
"" ===
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
"}}}
"}}}

" Editor Behavior--Basic Config {{{
"" ===
"" === Editor Behavior
"" ===

" Display relative line numbers
set relativenumber
" Show the line numbers(absolute) of the line 
" where the cursor is located
set ruler

" Highlight the line/column where the cursor is located
set cursorline
"set cursorcolumn

" Show invisible characters
set list
" Set which symbol to display invisible characters
set listchars=tab:>-,trail:-

" Displays the Status Line at the bottom of the window, second to last
set laststatus=2

" Set the statusline
" Preview all highlight groups with `:so $VIMRUNTIME/syntax/hitest.vim
set statusline=
set statusline+=%#CursorColumn#
set statusline+=%{StatuslineGit()}
set statusline+=%#Keyword#
set statusline+=\ %F
set statusline+=%m
set statusline+=%=
set statusline+=%#Normal#
set statusline+=\ %l,%c
set statusline+=%#Keyword#
set statusline+=\ %p%%
set statusline+=%#CursorColumn#
set statusline+=\ %{&fileformat}:%{&fileencoding?&fileencoding:&encoding}
set statusline+=%#WarningMsg#
set statusline+=\ %y

" Syntax highlighting
syntax on

" C++ indent
set cindent
"set smartindent

" Tab key:The increased indent will be converted to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Automatically matches the right bracket when you enter a left bracket
set showmatch

" Search:
" Highlight matching results
set hlsearch
" Enter a character and match it automatically
set incsearch
" Search for content that contains uppercase characters, it performs a case sensitive search; 
" if it searches for content that is only lowercase, it performs a case insensitive search
set ignorecase
set smartcase

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Press backspace key on the start of the current line 
" can go back to the previous line
set backspace=indent,eol,start

" Make cursor stay at the last position of last time
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" When scroll up and down, the cursor position is always 6 lines from the 
" top/bottom
set scrolloff=6

" Enable file type checking
filetype on
filetype plugin indent on

" Search down into subfolders
" Provides tab-completion for all file -related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

" Set Codings
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" Retain revocation history
set undofile
set undodir=$HOME/.config/vim_undofiles
" Stop generating swap files
set noswapfile
set history=1000
set showcmd

" Make the configuration file take effect immediately
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

set autoread
set autowriteall

" Not compatible with Vi
set nocompatible

"" Correct spelling
"set spell

"}}}

" vim:set fdm=marker:
