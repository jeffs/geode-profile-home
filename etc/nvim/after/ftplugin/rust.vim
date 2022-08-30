setlocal textwidth=79

if exists('b:my_rust_loaded')
        finish
endif

let b:my_rust_loaded = 1

if expand('%') == '/tmp/fmt.rs'
	setlocal nohidden
	nunmap q;
	nunmap q:
	nnoremap <buffer> q :q<CR>
endif

abbrev a! assert!
abbrev ae! assert_eq!
abbrev an! assert_ne!
abbrev f! format!
abbrev p! print!
abbrev pl! println!

" The cargo-norm program is part of rust-kart:
" https://github.com/jeffs/rust-kart/blob/master/cargo-norm/src/main.rs
nnoremap <buffer> <silent> <Leader>c :up<CR>:bel split \| te cargo check --bin `cargo-norm %`<CR>
nnoremap <buffer> <silent> <Leader>f :call MyRustFormat()<CR>
nnoremap <buffer> <silent> <Leader>l :up<CR>:bel split \| te cargo clippy --bin `cargo-norm %`<CR>
nnoremap <buffer> <silent> <Leader>r :up<CR>:bel split \| te cargo run --bin `cargo-norm %`<CR>
nnoremap <buffer> <silent> <Leader>t :up<CR>:bel split \| te cargo test --bin `cargo-norm %` -- --nocapture<CR>
"nnoremap <buffer> <silent> <Leader>t :up<CR>:bel split \| te RUST_BACKTRACE=1 cargo test --bin `cargo-norm %` minus -- --nocapture<CR>

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
setlocal colorcolumn=101 textwidth=79
setlocal nowrap number

let &breakindentopt = "shift:" . (&shiftwidth * 2)

if exists('*MyRustFormat')
        finish
endif

function MyRustFormat()
        update
	silent !rustfmt --edition=2021 % >& /tmp/fmt.rs
	if -1 == match(readfile('/tmp/fmt.rs'), '\S')
		edit
	else
		below split /tmp/fmt.rs
	endif
endfunction
