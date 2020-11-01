" _                __  __                   _             
"| | _____ _   _  |  \/  | __ _ _ __  _ __ (_)_ __   __ _ 
"| |/ / _ \ | | | | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` |
"|   <  __/ |_| | | |  | | (_| | |_) | |_) | | | | | (_| |
"|_|\_\___|\__, | |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |
"          |___/               |_|   |_|            |___/ 

"" start here!

"" LEADER key only take effect once
" define 'space' asLEADER key
let mapleader=" "
" space + enter means no high light, very useful!!!!
map <LEADER><CR> :nohlsearch<CR>

" press SPACE twice to jump to the next '<++>' and edit it
" similiar as a place-holder
" combine with VISUAL motion
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" paste motion when paste text from outside
imap <LEADER>p <Esc>"+p

""coc related key mapping
nnoremap co :CocCommand<space>
nnoremap <LEADER>t :CocCommand explorer<CR>
nmap md :set modifiable<CR>

"" self keyboard mapping
noremap K 5k
noremap J 5j
map Y y$
map 9 $

map S :w<CR>
map Q :q<CR>
map <space> <nop>
map s <nop>

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
