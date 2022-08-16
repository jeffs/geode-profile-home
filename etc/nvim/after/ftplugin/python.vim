if exists('b:my_python_loaded')
        finish
endif

let b:my_python_loaded = 1

if expand('%') == '/tmp/fmt.py'
	setlocal nohidden
	nunmap q;
	nunmap q:
	nnoremap q :q<CR>
endif


"setlocal colorcolumn=80 textwidth=79
setlocal colorcolumn=64 textwidth=63	" Substack code blocks suck.
"setlocal colorcolumn=43 textwidth=42	" Substack code blocks suck.

nnoremap <buffer> <silent> <Leader>c :up\|!mypy %<CR>
nnoremap <buffer> <silent> <Leader>i :up\|call MyPythonRepl()<CR><CR>
nnoremap <buffer> <silent> <Leader>f :call MyPythonFormat()<CR>
"nnoremap <buffer> <silent> <Leader>r :up\|!python3 %<CR>
"nnoremap <buffer> <silent> <Leader>r :up\|bel split \| te python3 -m %:h:t:r<CR>
nnoremap <buffer> <silent> <Leader>r :up\|bel split \| te python3 %<CR>

" Open a block.
inoremap <silent> <buffer> <C-j> <Esc>A:<CR>

function MyPythonRepl()
    execute '!tmux split-pane python3'
    execute '!tmux last-pane'
endfunction


if exists('*MyPythonFormat')
        finish
endif

function MyPythonFormat()
        update
	silent !python3 -m black --quiet --line-length=79 % >& /tmp/fmt.py
	if -1 == match(readfile('/tmp/fmt.py'), '\S')
		edit
	else
		below split /tmp/fmt.py
	endif
endfunction
