setlocal expandtab shiftwidth=2 softtabstop=-1
setlocal nowrap
setlocal number

abbrev #i import

nnoremap <buffer> <silent> <Leader>i :bel vert term node<CR>
nnoremap <buffer> <silent> <Leader>r :up\|bel vsplit term://node %<CR>
nnoremap <buffer> <silent> <Leader>s :e %:r.css<CR>

" Support gf on imports/requires, which are relative to the importing file.
lcd %:h
