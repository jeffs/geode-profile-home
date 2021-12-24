setlocal expandtab shiftwidth=2 softtabstop=-1
setlocal number

setlocal suffixesadd+=.js

nnoremap <buffer> <silent> <Leader>r :up\|bel vsplit term://node %<CR>
nnoremap <buffer> <silent> <Leader>s :e %:r.css<CR>
nnoremap <buffer> <silent> <Leader>t :e %:r.test.js<CR>
