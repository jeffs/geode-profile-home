setlocal nowrap
setlocal number

setlocal makeprg=go suffixesadd+=.go
"nnoremap <buffer> <silent> <Leader>b :up<CR>:make build %<CR>
nnoremap <buffer> <silent> <Leader>b :up<CR>:!scripts/build.zsh %<CR>
nnoremap <buffer> <silent> <Leader>f :up<CR>:%!goimports<CR>
nnoremap <buffer> <silent> <Leader>r :up<CR>:!go build % && ./%:r<CR>
nnoremap <buffer> <silent> <Leader>t :up<CR>:make test ./...<CR>

" Highlight tabs that aren't at the beginning of the line.
match ErrorMsg '[^\t]\@<=\t\+'
