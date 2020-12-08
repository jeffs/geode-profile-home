setlocal shiftwidth=4 softtabstop=-1

nnoremap <silent> <buffer> <Leader>b :w !markdown.zsh % > %.html<CR>
nnoremap <silent> <buffer> <Leader>c :w !count<CR>
nnoremap <silent> <buffer> <Leader>s mt:% !smart<CR>`t
