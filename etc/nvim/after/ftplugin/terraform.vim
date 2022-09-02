setlocal iskeyword+=-

" Align selected text into columns; e.g., key/value pairs.
nnoremap <buffer> <silent> <Leader>f vi{!column -to ' '<CR>=i{
vnoremap <buffer> <silent> <Leader>f !column -to ' '<CR>=ip

nnoremap <buffer> <silent> <Leader>c :up \| bel split term://terraform plan --var-file=terraform-dev.tfvars<CR>
nnoremap <buffer> <silent> <Leader>r :up \| bel split term://terraform apply --var-file=terraform-dev.tfvars<CR>

inoremap <buffer> <silent> <Esc> <Esc>:up<CR>
nnoremap <buffer> <silent> <Esc> <Esc>:up<CR>
inoremap <buffer> <C-g> <Esc>
inoremap <buffer> <C-g> <Esc>
