""                                  _                    
""       _ __ ___  _   _     __   _(_)_ __ ___  _ __ ___ 
""      | '_ ` _ \| | | |____\ \ / / | '_ ` _ \| '__/ __|
""      | | | | | | |_| |_____\ V /| | | | | | | | | (__ 
""      |_| |_| |_|\__, |      \_/ |_|_| |_| |_|_|  \___|
""                 |___/                                 

" Appereance {{{
set background=dark

"color koehler
"color molokai
color gruvbox

" For gvim
set guifont=SauceCodePro\ Nerd\ Font\ Mono\ 14

" Displays the Status Line on the second to last line of the window
set laststatus=2

" Set the statusline
" Preview all highlight groups with `:so $VIMRUNTIME/syntax/hitest.vim
set statusline=
set statusline+=%#Normal#
set statusline+=%{StatuslineGit()}
set statusline+=%#Keyword#
set statusline+=\ %F
set statusline+=%m
set statusline+=%=
set statusline+=%#Normal#
set statusline+=\ %l,%c
set statusline+=%#Keyword#
set statusline+=\ %p%%
set statusline+=%#Normal#
set statusline+=\ %{&fileformat}:%{&fileencoding?&fileencoding:&encoding}
set statusline+=%#Keyword#
set statusline+=\%y

"}}}

" Editor Behavior {{{
"" ===
"" === Editor Behavior
"" ===
"
"" === 
"" TWO important settings
"" ===

"" The length of time Vim waits after you stop typing before it triggers the plugin is governed by the setting updatetime.
"" DEFAULT:4000(ms)
"
"" Affected functions:
"" vim-gitgutter
set updatetime=600

"" Key-specific timeoutlen in vim
"" Example: In normal mode, the 'b' key has been bound to Buffer related operations. Like:bd
"" bs, but 'b' key also has its default functions--'go back to the previous
"" word'. So there will be a short delay everytime you press the 'b' key.
""
"" 'timeoutlen' is the length of the delay time.
"" The keys you have typed during the delay time will be identified as
"" 'Specific-key'
"" Example: if you type 'b' and 'd' within TIMEOUTLEN, the vim will trigger
"" 'buffer down'
""
"" Affected bindings:
"" 'oh oj ok ol' and 'o'
"" 'bh bj bk bl bs bd' and 'b'
set timeoutlen=500
nnoremap B b
nnoremap O o
nnoremap o <nop>
nnoremap b <nop>

" Do not load the 'matchparen' plugin
" Path: /usr/share/vim/vim82/plugin/matchparen.vim
" Describe: Highlight the matching brackets
let loaded_matchparen = 1

" Turn off the bracket matching
set noshowmatch

set lazyredraw
set ttyfast

"" Make the configuration file take effect immediately
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"" Automatically matches the right bracket when you enter a left bracket
"set showmatch

"set autoread
"set autowriteall

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

set hidden

" Retain revocation history
set undofile
set undodir=$HOME/.config/vim_undofiles
" Stop generating swap files
set noswapfile
set history=1000
set showcmd

set autochdir
" Auto change directory to current dir
"autocmd BufEnter * silent! lcd %:p:h

" Not compatible with Vi
set nocompatible

"" Correct spelling
"set spell

"}}}

" Key Mappings {{{
" Basic Mappings {{{
"" ===
"" === Basic Mappings
"" ===
" define 'space' as <LEADER>
let mapleader=" "
"" Attention!!!!
"" Don't bind any insert-mode operations to <LEADER>!!!!
"" If you are using <SPACE> as mapleader

" Press <SPACE> twice to jump to the next '<++>' and edit it
" as similiar as a place-holder
nnoremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" space + enter means no high light, very useful!!!!
nnoremap <LEADER><CR> :nohlsearch<CR>

" copy/paste to the System clipboard
vnoremap <LEADER>y "+y
nnoremap <LEADER>p "+p
"" ctrl + ;
"" open a memu to select contents from history system clipboard
"" <Tab> to switch around results
"" <Space> to paste the chosen contents

" Press F4 to toggle syntax
nnoremap <F4> :exec exists('syntax_on') ? 'syn off': 'syn on'<CR>

" Faster save and quit
map S :w<CR>
map Q :q<CR>

nnoremap ; :
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
nnoremap <LEADER>q <C-w>j:q<CR>
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
" List the buffers
nnoremap bs :ls b<CR>
"}}}
"}}}

" Plugins {{{
" Install {{{
"" ===
"" install plug
"" ===

"" Minpac should be installed under pack/minpac/opt/ in the first directory in the 'packpath' option
"" So check out which is the first by `set packpath?`
"
"" Set packpath maually
"" Reference: https://vi.stackexchange.com/questions/22359/how-to-change-location-of-vim
"" set packpath^=~/.vim
"
"" NOTE: minpac use the latest feature--'packages'
"" See: `:help packages` for detail.

function! PackInit() abort
    packadd minpac
    call minpac#init()
    " Nerd tree
    call minpac#add('preservim/nerdtree', {'type': 'opt'})
    " Useful buffer display
    call minpac#add('bling/vim-bufferline', {'type': 'start'})
    " Exquisite tabline
    call minpac#add('mg979/vim-xtabline', {'type': 'start'})
    " Undo Tree
    call minpac#add('mbbill/undotree', {'type': 'start'})
    " Git status plug
    call minpac#add('airblade/vim-gitgutter', {'type': 'start'})
    " FZF
    call minpac#add('junegunn/fzf.vim', {'type': 'start'})
    "" markdown
    " markdown table mode
    call minpac#add('dhruvasagar/vim-table-mode', {'type':'start', 'for':'markdown'})
    " Markdown TOC
    call minpac#add('mzlogin/vim-markdown-toc', {'type':'start', 'for':'markdown'})
    " Markdown preview
    " Execute commands `:call mkdp#util#install()` after installation. 
    " Ps: privoxy' may be needed
    call minpac#add('iamcco/markdown-preview.nvim', {'type': 'start', 'for':'markdown'})
    " devicons
    call minpac#add('ryanoasis/vim-devicons', {'type':'start'})
endfunction

command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

"}}}

" Configurations {{{
"" ===
"" === NERD tree
"" ===
nnoremap <LEADER>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


"" ===
"" === Buffer line
"" ===
"let g:bufferline_active_buffer_left = '{'
"let g:bufferline_active_buffer_right = '}'


" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
"noremap to :XTabCycleMode<CR>
"noremap \p :echo expand('%:p')<CR>


" ===
" === Undotree
" ===
nnoremap <LEADER>u :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
endfunc


"" ===
"" git status plug
"" vim-gitgutter
"" ===
"" You can jump between hunks with [c and ]c. You can preview, stage, and undo
"" hunks with <leader>hp, <leader>hs, and <leader>hu respectively.


" remove the limits of the size of signs
let g:gitgutter_max_signs = -1
" make background colours match the sign column
let g:gitgutter_set_sign_backgrounds = 1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" ===
" === FZF
" ===
" Search in files in the current directory
nnoremap <silent> <C-p> :Files<CR>
" Search in use ripgrep
" `sudo pacman -S ripgrep`
nnoremap <silent> <C-f> :Rg<CR>
"" Search in ctags
"noremap <C-t> :BTags<CR>
" Search in lines of the current file
nnoremap <silent> <C-l> :Lines<CR>
" Search in buffers
nnoremap <silent> <C-b> :Buffers<CR>
" History of opened files
nnoremap <silent> <C-h> :History<CR>
" Commands History
nnoremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


""$    " ===
""$    " === vim-visual-multi
""$    " ===
""$    "let g:VM_theme             = 'iceblue'
""$    "let g:VM_default_mappings = 0
""$    let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
""$    let g:VM_maps                       = {}
""$    "let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
""$    let g:VM_maps['i']                  = 'k'
""$    let g:VM_maps['I']                  = 'K'
""$    let g:VM_maps['Find Under']         = '<C-k>'
""$    let g:VM_maps['Find Subword Under'] = '<C-k>'
""$    let g:VM_maps['Find Next']          = ''
""$    let g:VM_maps['Find Prev']          = ''
""$    let g:VM_maps['Remove Region']      = 'q'
""$    "let g:VM_maps['Skip Region']        = '<c-n>'
""$    let g:VM_maps["Undo"]               = 'l'
""$    "let g:VM_maps["Redo"]               = '<C-r>'


"" ===
"" vim table mode for markdown
"" ===
map tm :TableModeToggle<CR>


"" ===
"" vim markdown preview
"" ===
map mp :MarkdownPreview<CR>
map ms :MarkdownPreviewStop<CR>

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

let g:mkdp_open_to_the_world = 0
let g:mkdp_browser = 'firefox'

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
\}


"" ===
"" === Markdown TOC
"" ===
let g:vmt_cycle_list_item_markers = 1

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

nnoremap <LEADER>n :Ranger<CR>
nnoremap <LEADER>o :RangerNewTab<CR>
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
    :res -8
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
    exec "!".g:mkdp_browser." % &"
elseif &filetype == 'markdown'
    exec "MarkdownPreview"
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

noremap <C-r> :call CompileRunGcc()<CR><C-w>k
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
autocmd Filetype cpp,c inoremap <buffer> ,for <Esc>:-1read$HOME/.vim/code-snippets/c++_for_.snippets<CR>
"}}}
"}}}

" vim:set fdm=marker:
