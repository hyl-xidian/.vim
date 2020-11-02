"
"  __  __            _       _                     
" |  \/  | __ _ _ __| | ____| | _____      ___ __  
" | |\/| |/ _` | '__| |/ / _` |/ _ \ \ /\ / / '_ \ 
" | |  | | (_| | |  |   < (_| | (_) \ V  V /| | | |
" |_|  |_|\__,_|_|  |_|\_\__,_|\___/ \_/\_/ |_| |_|
"                                                  

"" ===
"" install plug
"" ===
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

"vim table mode
Plug 'dhruvasagar/vim-table-mode'

"vim markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'ryanoasis/vim-devicons'

call plug#end()

"autocmd VimEnter * PlugInstall

"" ===
"" === NERD tree
"" ===
noremap <LEADER>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


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
\ }
