"
"  ____            
" / ___| _     _   
"| |   _| |_ _| |_ 
"| |__|_   _|_   _|
" \____||_|   |_|  
"                  

"" ===
"" install plug
"" ===
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

" git status plug
Plug 'airblade/vim-gitgutter'

" coc code complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

"" Error checking
" Plug 'dense-analysis/ale'

"" Taglist
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

call plug#end()

"" ===
"" === NERD tree
"" ===
noremap <LEADER>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


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


"" ===
"" tagbar
"" ===
"nmap <F8> :TagbarToggle<CR>


"" ===
"" coc.nvim
"" ===
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-marketplace', 'coc-explorer', 'coc-translator']

"" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=100

" merge signcolumn and number column into one
"set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Make <CR> auto-select the first completion item and notify coc.nvim to
"" " format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> <LEADER>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>m :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
elseif (coc#rpc#ready())
call CocActionAsync('doHover')
else
execute '!' . &keywordprg . " " . expand('<cword>')
endif
endfunction

"nnoremap <LEADER>t :CocCommand explorer<CR>
nnoremap co :CocCommand

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
