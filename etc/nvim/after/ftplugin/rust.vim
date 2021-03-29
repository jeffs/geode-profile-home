inoremap <buffer> <Esc> <Esc>:up<CR>
inoremap <buffer> <C-g> <Esc>:up<CR>
nnoremap <buffer> <C-g> <Esc>:up<CR>

" This breaks Vim on macOS for some reason.
" (It inputs :2R on startup.  Meaningless.)
"nnoremap <buffer> <silent> <Esc> :up<CR>

set formatprg=rustfmt

nnoremap <silent> <Leader>b :up<CR>:term cargo build<CR>
nnoremap <silent> <Leader>c :up<CR>:term cargo check<CR>
nnoremap <silent> <Leader>r :up<CR>:term cargo run<CR>

nnoremap <silent> <Leader>f gggqG<C-o><C-o>
nnoremap <silent> <Leader>l :exe "!cargo clean -p" fnamemodify(getcwd(), ':t') <CR>

hi Todo ctermbg=NONE ctermfg=darkgray

set colorcolumn=101 textwidth=79
set nowrap number

let &breakindentopt = "shift:" . (&shiftwidth * 2)
