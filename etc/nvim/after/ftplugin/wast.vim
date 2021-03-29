set expandtab shiftwidth=2 softtabstop=-1
inoremap <silent> <C-j> <Esc>:s/\s*$//<CR>o)<Esc><lt><lt>O
nnoremap <buffer> <silent> <Leader>b :up \| !wat2wasm % -o %:r.wasm<CR>
