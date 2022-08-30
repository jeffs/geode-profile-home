if exists('b:my_go_loaded')
        finish
endif

let b:my_go_loaded = 1

if expand('%') == '/tmp/fmt.go'
	setlocal nohidden
	nunmap q;
	nunmap q:
	nnoremap <buffer> q :q<CR>
endif

setlocal nowrap
setlocal number
setlocal shiftwidth=4 tabstop=4

setlocal makeprg=go suffixesadd+=.go
nnoremap <buffer> <silent> <Leader>b :up<CR>:!go build ./...<CR>
nnoremap <buffer> <silent> <Leader>f :up<CR>:%!goimports<CR>
nnoremap <buffer> <silent> <Leader>f :call MyGoFormat()<CR>
nnoremap <buffer> <silent> <Leader>r :up<CR>:!go run %:p<CR>
nnoremap <buffer> <silent> <Leader>t :up<CR>:go test ./...<CR>

" Highlight tabs that aren't at the beginning of the line.
match ErrorMsg '[^\t]\@<=\t\+'

if exists('*MyGoFormat')
        finish
endif

function MyGoFormat()
        update
	silent !goimports -w % >& /tmp/fmt.go
	if -1 == match(readfile('/tmp/fmt.go'), '\S')
		edit
	else
		below split /tmp/fmt.go
	endif
endfunction
