setlocal expandtab shiftwidth=4 softtabstop=-1
setlocal foldlevel=0 foldmethod=manual
setlocal nowrap

nnoremap <silent> <buffer> <Leader>r :!zsh %<CR>

nnoremap K :Man <C-r>=expand('<cword>')<CR><CR>
