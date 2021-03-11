setlocal shiftwidth=4 softtabstop=-1

nnoremap <silent> <buffer> <Leader>b :w !markdown.zsh % > %.html<CR>
nnoremap <silent> <buffer> <Leader>c :w !count<CR>

let g:markdown_fenced_languages = [
	\ 'css',
	\ 'javascript', 'js=javascript', 'json=javascript',
	\ 'rust', 'rs=rust',
	\ 'sh=sh' ]

" ⌘ U+2318 Place of interest sign
" ⇧ U+21E7 Level 2 select key
