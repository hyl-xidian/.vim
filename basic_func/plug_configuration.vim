" ____  _                ____             __ _       
"|  _ \| |_   _  __ _   / ___|___  _ __  / _(_) __ _ 
"| |_) | | | | |/ _` | | |   / _ \| '_ \| |_| |/ _` |
"|  __/| | |_| | (_| | | |__| (_) | | | |  _| | (_| |
"|_|   |_|\__,_|\__, |  \____\___/|_| |_|_| |_|\__, |
"               |___/                          |___/ 

"" ===
"" install plug
"" ===
call plug#begin('~/.vim/plugged')

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"vim table mode
Plug 'dhruvasagar/vim-table-mode'

"vim markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" coc code complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" colorscheme
"Plug 'morhetz/gruvbox'
"Plug 'altercation/vim-colors-solarized'
"Plug 'miyakogi/seiya.vim'

"" git status plug
"Plug 'airblade/vim-gitgutter'

"" Error checking
" Plug 'dense-analysis/ale'

"" Taglist
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

"" ranger.vim
"Plug 'francoiscabrol/ranger.vim'

"" Bookmarks
"Plug 'kshenoy/vim-signature'
call plug#end()

"" ===
"" airline settings
"" ===
let g:airline_theme= 'base16_google'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


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


"" ===
"" set a colorscheme
"" ===
"let g:seiya_auto_enable=1

"colorscheme solarized
"set background=dark
"let g:solarized_termcolors=256

"colorscheme gruvbox
"let g:gruvbox_termcolors=256
"let g:gruvbox_italic=1
"set background=dark
"let g:gruvbox_contrast_dark='hard'


""$    "" ===
""$    "" git status plug
""$    "" vim-gitgutter
""$    "" ===
""$    "" You can jump between hunks with [c and ]c. You can preview, stage, and undo
""$    "" hunks with <leader>hp, <leader>hs, and <leader>hu respectively.
""$    set updatetime=100
""$    " remove the limits of the size of signs
""$    let g:gitgutter_max_signs = -1
""$    " make background colours match the sign column
""$    let g:gitgutter_set_sign_backgrounds = 1

""$    "" ===
""$    "" file navigation settings
""$    "" ===
""$    " ranger.vim
""$    """"!!!!! coc.nvim-explorer is better!!!!
""$    let g:ranger_map_keys = 0
""$    ""map <LEADER>o :Ranger<CR>
""$    map <LEADER>o :RangerNewTab<CR>
""$    ""add this line if you use NERDTree
""$    "let g:NERDTreeHijackNetrw = 0 
""$    "" open ranger when vim open a directory
""$    "let g:ranger_replace_netrw = 1 


"" ===
"" tagbar
"" ===
"nmap <F8> :TagbarToggle<CR>


""$    "" ===
""$    "" coc.nvim
""$    "" ===
""$    let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-marketplace', 'coc-explorer', 'coc-translator']
""$    " TextEdit might fail if hidden is not set.
""$    set hidden
""$    
""$    "" Some servers have issues with backup files, see #649.
""$    set nobackup
""$    set nowritebackup
""$    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
""$    " " delays and poor user experience.
""$    set updatetime=200
""$    " Don't pass messages to |ins-completion-menu|.
""$    set shortmess+=c
""$    
""$    " merge signcolumn and number column into one
""$    "set signcolumn=number
""$    
""$    " Use tab for trigger completion with characters ahead and navigate.
""$    " " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
""$    " " other plugin before putting this into your config.
""$    inoremap <silent><expr> <TAB>
""$        \ pumvisible() ? "\<C-n>" :
""$        \ <SID>check_back_space() ? "\<TAB>" :
""$        \ coc#refresh()
""$    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
""$    
""$    function! s:check_back_space() abort
""$        let col = col('.') - 1
""$        return !col || getline('.')[col - 1]  =~# '\s'
""$    endfunction
""$    
""$    " Make <CR> auto-select the first completion item and notify coc.nvim to
""$    " " format on enter, <cr> could be remapped by other vim plugin
""$    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
""$                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
""$    
""$    " Use `[g` and `]g` to navigate diagnostics
""$    " " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
""$    " list.
""$    nmap <silent> <LEADER>[ <Plug>(coc-diagnostic-prev)
""$    nmap <silent> <LEADER>] <Plug>(coc-diagnostic-next)
""$    
""$    " GoTo code navigation.
""$    nmap <silent> gd <Plug>(coc-definition)
""$    nmap <silent> gy <Plug>(coc-type-definition)
""$    nmap <silent> gi <Plug>(coc-implementation)
""$    nmap <silent> gr <Plug>(coc-references)
""$    
""$    " Use K to show documentation in preview window.
""$    nnoremap <silent> <LEADER>m :call <SID>show_documentation()<CR>
""$    
""$    function! s:show_documentation()
""$    if (index(['vim','help'], &filetype) >= 0)
""$    execute 'h '.expand('<cword>')
""$    elseif (coc#rpc#ready())
""$    call CocActionAsync('doHover')
""$    else
""$    execute '!' . &keywordprg . " " . expand('<cword>')
""$    endif
""$    endfunction
""$    
""$    "" Applying codeAction to the selected region.
""$    "" Example: `<leader>aap` for current paragraph
""$    "xmap <leader>a  <Plug>(coc-codeaction-selected)
""$    "nmap <leader>a  <Plug>(coc-codeaction-selected)
