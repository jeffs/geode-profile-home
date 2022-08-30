abbrev #i #include

setlocal expandtab shiftwidth=4 softtabstop=-1

nnoremap <buffer> <silent> <Leader>c :up<CR>:bel split \| te make <CR>
nnoremap <buffer> <silent> <Leader>r :up<CR>:bel split \| te make run<CR>
