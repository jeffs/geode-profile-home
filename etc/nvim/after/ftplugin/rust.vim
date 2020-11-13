abbrev a! assert!
abbrev ae! assert_eq!
abbrev an! assert_ne!
abbrev f! format!
abbrev p! print!
abbrev pl! println!

"nnoremap <Leader>b :up<CR>:bel vsplit \| ter cargo build<CR>
nnoremap <silent> <Leader>b :up<CR>:!tmux-build.zsh<CR><CR>
nnoremap <Leader>c :up<CR>:bel vsplit \| ter cargo check<CR>
nnoremap <Leader>f :call Format()<CR>
nnoremap <Leader>l :exe "!cargo clean -p" fnamemodify(getcwd(), ':t') <CR>
nnoremap <Leader>r :up<CR>:bel vsplit \| ter cargo --quiet run<CR>

inoremap <buffer> <silent> <Esc> <Esc>:up<CR>
nnoremap <buffer> <silent> <Esc> <Esc>:up<CR>

" Rust has a de facto standard limit of 99 columns for code and comments.  I
" strongly prefer the old 79-column for comments, because 99-column panes are
" too wide for side-by-side columns at a font size I can read.  This is an
" important accessibility consideration for me.
"
" Setting textwidth lets Vim wrap my comments at 79, while `rustfmt` continues
" to respect the 99-column convention for code.  In practice, my code rarely
" exceeds 79 columns anyway, and I can tolerate the occasional line that
" extends past the right edge of my editor window.  Win/win.
"
" The Rust core team apparently used to suggest exactly this dichotomy, but
" dropped it for simplicity.  See also this discussion from 2014:
" https://github.com/rust-lang/rust-guidelines/pull/12#issuecomment-48007836
set colorcolumn=100 textwidth=79
set nowrap number


function Format()
	let save_pos = getpos(".")
	%!rustfmt
	call setpos('.', save_pos)
endfunction
