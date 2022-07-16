setlocal expandtab shiftwidth=2 softtabstop=-1
setlocal number
setlocal suffixesadd+=.js
setlocal foldlevel=99

if exists('b:my_js_loaded')
        finish
endif

let b:my_js_loaded = 1

if expand('%') == '/tmp/fmt.js'
	setlocal nohidden
	nunmap q;
	nunmap q:
	nnoremap q :q<CR>
endif

nnoremap <buffer> <silent> <Leader>f :call MyJSFormat()<CR>
nnoremap <buffer> <silent> <Leader>r :up\|bel vsplit term://node %<CR>
nnoremap <buffer> <silent> <Leader>s :e %:r.css<CR>
nnoremap <buffer> <silent> <Leader>t :e %:r.test.js<CR>

if exists('*MyJSFormat')
        finish
endif

function MyJSFormat()
        update
	silent !prettier --write % >& /tmp/fmt.js
	if 1 < len(readfile('/tmp/fmt.js'))
		below split /tmp/fmt.js
	else
		edit
	endif
endfunction
