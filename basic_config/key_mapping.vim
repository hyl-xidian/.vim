" _                __  __                   _             
"| | _____ _   _  |  \/  | __ _ _ __  _ __ (_)_ __   __ _ 
"| |/ / _ \ | | | | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` |
"|   <  __/ |_| | | |  | | (_| | |_) | |_) | | | | | (_| |
"|_|\_\___|\__, | |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |
"          |___/               |_|   |_|            |___/ 

"" start here!

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


"" ===
"" === Command Mode Cursor Movement
"" ===
cnoremap <C-h> <Left>
cnoremap <C-l> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>


"" ===
"" === Window mangement
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


"" ===
"" === Tab management
"" ===
" move around tabs with 'th' and 'tl'
nmap tl :+tabnext<CR>
nmap th :-tabnext<CR>
" open a new tab
nmap tn :tabnew<CR>

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
