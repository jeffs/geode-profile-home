abbrev #i #include

setlocal expandtab shiftwidth=4 softtabstop=-1

nnoremap <buffer> <silent> <Leader>c :up<CR>:bel split \| te make <CR>
nnoremap <buffer> <silent> <Leader>f :up<CR>:up \| exe('%!clang-format --fallback-style=llvm --style=file:$HOME/conf/etc/clang-format') \| up<CR>
nnoremap <buffer> <silent> <Leader>r :up<CR>:bel split \| te make run<CR>
