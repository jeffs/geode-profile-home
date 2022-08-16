setlocal expandtab shiftwidth=2 softtabstop=-1
setlocal smartindent
setlocal number
setlocal suffixesadd+=.tsx
setlocal foldlevel=99

if exists('b:my_tsx_loaded')
	finish
endif

let b:my_tsx_loaded = 1

nnoremap <buffer> <silent> <Leader>f :call MyTSXFormat()<CR>
nnoremap <buffer> <silent> <Leader>j :e %:r:r.tsx<CR>
nnoremap <buffer> <silent> <Leader>s :e %:r:r.css<CR>
nnoremap <buffer> <silent> <Leader>t :e %:r:r.test.tsx<CR>

function MyTSXFormat()
	update
	silent !yarn fmt >& /tmp/fmt.js
	if v:shell_error != 0
		below split /tmp/fmt.js
	else
		edit
	endif
endfunction
