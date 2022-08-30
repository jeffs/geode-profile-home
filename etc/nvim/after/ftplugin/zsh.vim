setlocal expandtab shiftwidth=4 softtabstop=-1
setlocal foldlevel=0 foldmethod=manual
setlocal nowrap

nnoremap <buffer> <silent> <buffer> <Leader>r :!zsh %<CR>

nnoremap <buffer> K :Man <C-r>=expand('<cword>')<CR><CR>
