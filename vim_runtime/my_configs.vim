

"" escape 
inoremap jk <esc>

"map <c-g> <c-c>
"map! <c-g> <c-c> 
inoremap <c-g> <c-c>
vnoremap <c-g> <c-c> 
cnoremap <c-g> <c-c>

"" swap jump back and forward
nnoremap <c-i> <c-o>
nnoremap <c-o> <c-i>

"" YouCompleteMe
let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf = '/home/work/wanghuaidong/.vim_runtime/sources_non_forked/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_python_binary_path = '/home/work/.jumbo/bin/python'

nnoremap <leader>, :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>. :YcmCompleter GoToReferences<CR>

"" tagbar
" nnoremap <silent> <f9> :TagbarToggle<cr>
nnoremap <silent> <c-p> :TagbarToggle<cr>

"" vim-airline
let g:airline#extensions#tabline#enabled = 1
if has("gui_running")
    let g:airline_powerline_fonts = 1
    " temporary solution to show tabline in gui
    au VimEnter * AirlineToggle
    au VimEnter * AirlineToggle
endif
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" buffer next and previous
" nnoremap <leader>k :bnext<cr>
" nnoremap <leader>j :bprevious<cr>
nnoremap K :bnext<cr>
nnoremap J :bprevious<cr>

" nerd tree toggle
nnoremap <c-n> :NERDTreeToggle<cr>

" use ctrlp for recent files search
map <leader>f :CtrlPMRUFiles<cr>

" emacs like beginning and end of line
imap <C-A> <C-O>0
imap <C-E> <C-O>$

" number
set number

"UltiSnip
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" vim-pencil
" augroup pencil
"     autocmd!
"     autocmd FileType markdown,mkd call pencil#init()
"     autocmd FileType text         call pencil#init()
" augroup END

" for Mac terminal (default terminal or iTerm) to enable scroll
set mouse=a
vmap <C-c> "+y


" pymode 
let g:pymode_doc = 0
" let g:pymode_doc_bind = <F6>
" let g:pymode_doc_bind = "<C-S-d>"

" disable, auto-complete is via youcompleteme
let g:pymode_rope_completion = 0
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_rope = 0

nmap <s-space> [m
nmap <space> ]m
nmap ][ [m
nmap [] ]m



" set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set fileencodings=ucs-bom,gbk,utf-8,utf-16,big5,gb18030,latin1
" set fileencodings=utf-8,utf-16,gbk,big5,gb18030,latin1

iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

" easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" markdown 
let g:vim_markdown_folding_disabled = 1

" exclude = isfame so gf can jump to file under the curor, e.g. fname=./test.py
set isfname-==
nnoremap * *``
" nnoremap <leader>, <c-]>
"

" concise layout
" set fillchars+=vert:©¦
hi VertSplit ctermbg=NONE guibg=NONE
set foldcolumn=0
