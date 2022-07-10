" disable hjkl

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" show spaces
:set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
:set list

" highlight cursor line
:set cursorline

" show line number + ruler
set number
set ruler

" explorer
map <C-b> :E<CR>

" auto indent
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

" sync yank with clipboard (macos)
set clipboard=unnamed

" natural split
set splitbelow
set splitright

" quick word global replace
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" syntax highlight
Plug 'fatih/molokai'
" l + ls
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ziglang/zig.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" fuzzy find
let mapleader = " "
nnoremap <silent> <Space><Space> :Files<CR>
nnoremap <silent> <Space>. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <Space>g :GFiles?
nnoremap <silent> <Space>m :FZFMru<CR>
nnoremap <silent> <Space>b :Buffers<CR>

" rip grep
nnoremap <Space>/ :Rg<Space>

" coc
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" close location + quickfix lists
nmap <leader>c :windo lcl\|ccl<CR>

" go things

" auto write when :make => :GoBuild, :GoRun
set autowrite
nmap <silent> [l :lprev<CR>
nmap <silent> ]l :lnext <CR>
nmap <silent> [q :lprev <CR>
nmap <silent> ]q :lnext <CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
map <leader>p :GoReferrers<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-referrers)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>i <Plug>(go-describe)
autocmd FileType go nnoremap <buffer> <silent> gk :GoDecls<cr>
autocmd FileType go nnoremap <buffer> <silent> gl :GoDecls<cr>

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_guru_scope = ["..."]
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" go info: show info of identifier automatically
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
" go info: refresh rate (ms)
set updatetime=100

" syntax highlight
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

