setlocal expandtab shiftwidth=2 softtabstop=-1
setlocal smartindent
setlocal number
setlocal suffixesadd+=.tsx
setlocal foldlevel=99

if exists('b:my_tsx_loaded')
	finish
endif

let b:my_tsx_loaded = 1

"inoremap <buffer> <silent> <Esc> <Esc>:up<CR>
"nnoremap <buffer> <silent> <Esc> <Esc>:up<CR>
inoremap <buffer> <C-g> <Esc>
inoremap <buffer> <C-g> <Esc>

nnoremap <buffer> <silent> <Leader>f :call MyTSXFormat()<CR>
nnoremap <buffer> <silent> <Leader>j :e %:r:r.tsx<CR>
nnoremap <buffer> <silent> <Leader>s :e %:r:r.css<CR>
nnoremap <buffer> <silent> <Leader>t :e %:r:r.test.tsx<CR>

function MyTSXFormat()
	update
	silent !npx prettier --write % >& /tmp/fmt.js
	if v:shell_error != 0
		below split /tmp/fmt.js
	else
		edit
	endif
endfunction
