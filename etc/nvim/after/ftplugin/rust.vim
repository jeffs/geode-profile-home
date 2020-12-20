abbrev a! assert!
abbrev ae! assert_eq!
abbrev an! assert_ne!
abbrev f! format!
abbrev p! print!
abbrev pl! println!

set formatprg=rustfmt

"nnoremap <Leader>b :up<CR>:bel vsplit \| ter cargo build<CR>
nnoremap <silent> <Leader>b :up<CR>:!./scripts/tmux-check.zsh<CR><CR>
nnoremap <silent> <Leader>c :up<CR>:bel vsplit \| ter cargo check<CR>
nnoremap <silent> <Leader>f gggqG<C-o><C-o>
nnoremap <silent> <Leader>l :exe "!cargo clean -p" fnamemodify(getcwd(), ':t') <CR>
"nnoremap <silent> <Leader>r :up<CR>:bel vsplit \| ter cargo --quiet run<CR>
nnoremap <silent> <Leader>r :up<CR>:!./scripts/tmux-run.zsh<CR><CR>

inoremap <buffer> <silent> <Esc> <Esc>:up<CR>
nnoremap <buffer> <silent> <Esc> <Esc>:up<CR>
inoremap <buffer> <C-g> <Esc>
inoremap <buffer> <C-g> <Esc>

hi Todo ctermbg=NONE ctermfg=darkgray

" Rust has a de facto standard limit of 100 columns for code and comments.  I
" strongly prefer the old 79-column for comments, because 100-column panes are
" too wide for side-by-side columns at a font size I can read.  This is an
" important accessibility consideration for me.
"
" Setting textwidth lets Vim wrap my comments at 79, while `rustfmt` continues
" to respect the 100-column convention for code.  In practice, my code rarely
" exceeds 79 columns anyway, and I can tolerate the occasional line that
" extends past the right edge of my editor window.  Win/win.
"
" The Rust core team apparently used to suggest a similar dichotomy, but
" dropped it for simplicity.  See also this discussion from 2014:
" https://github.com/rust-lang/rust-guidelines/pull/12#issuecomment-48007836
"
" As of 2018, some folks seem(ed) to share this assessment:
" https://internals.rust-lang.org/t/style-guide-for-comments/8995/2
set colorcolumn=101 textwidth=79
set nowrap number

let &breakindentopt = "shift:" . (&shiftwidth * 2)

function Format()
	let save_pos = getpos(".")
	%!rustfmt --edition=2018
	call setpos('.', save_pos)
endfunction
