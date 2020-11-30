setlocal expandtab shiftwidth=2 softtabstop=-1
setlocal number

nnoremap <buffer> <silent> <Leader>r :up\|bel vsplit term://node %<CR>
nnoremap <buffer> <silent> <Leader>s :e %:r.css<CR>
