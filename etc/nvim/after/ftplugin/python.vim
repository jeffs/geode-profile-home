function Repl()
    execute '!tmux split-pane python3'
    execute '!tmux last-pane'
endfunction

nnoremap <buffer> <silent> <Leader>c :up\|!mypy %<CR>
nnoremap <buffer> <silent> <Leader>i :up\|call Repl()<CR><CR>
nnoremap <buffer> <silent> <Leader>f :up\|silent !python3 -m black --line-length=79 %<CR><CR>\|:edit<CR>
nnoremap <buffer> <silent> <Leader>r :up\|!python3 %<CR>

" Open a block.
inoremap <silent> <buffer> <C-j> <Esc>A:<CR>
