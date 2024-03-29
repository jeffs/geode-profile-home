"setlocal formatoptions+=a nowrap " Insert line breaks automatically.
setlocal shiftwidth=4 softtabstop=-1 expandtab
setlocal suffixesadd+=.md
setlocal foldmethod=manual

nnoremap <silent> <buffer> <Leader>b :w !markdown % > %.html<CR>

let g:markdown_fenced_languages = [
	\ 'css',
	\ 'javascript', 'js=javascript', 'json=javascript',
	\ 'python', 'py=python',
	\ 'rust', 'rs=rust',
	\ 'sh=sh' ]

" ⌘ U+2318 Place of interest sign
" ⇧ U+21E7 Level 2 select key
