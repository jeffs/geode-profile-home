setlocal expandtab shiftwidth=4 softtabstop=-1
setlocal nowrap

nnoremap <silent> <buffer> <Leader>r :!zsh %<CR>

nnoremap K :Man <C-r>=expand('<cword>')<CR><CR>
