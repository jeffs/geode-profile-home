setlocal iskeyword+=-

if exists('b:my_terraform_loaded')
        finish
endif

let b:my_terraform_loaded = 1

if expand('%') == '/tmp/fmt.tf'
	setlocal nohidden
	nunmap q;
	nunmap q:
	nnoremap <buffer> q :q<CR>
endif

"nnoremap <buffer> <silent> <Leader>c :up \| bel split term://terraform plan --var-file=terraform-dev.tfvars<CR>
"nnoremap <buffer> <silent> <Leader>d :up \| bel split term://terraform destroy --var-file=terraform-dev.tfvars<CR>
"nnoremap <buffer> <silent> <Leader>r :up \| bel split term://terraform apply --var-file=terraform-dev.tfvars<CR>

nnoremap <buffer> <silent> <Leader>c :up \| bel split term://terraform plan<CR>
nnoremap <buffer> <silent> <Leader>d :up \| bel split term://terraform destroy<CR>
nnoremap <buffer> <silent> <Leader>r :up \| bel split term://terraform apply<CR>

nnoremap <buffer> <silent> <Leader>f :call MyTerraformFormat()<CR>

"inoremap <buffer> <silent> <Esc> <Esc>:up<CR>
"nnoremap <buffer> <silent> <Esc> <Esc>:up<CR>
inoremap <buffer> <C-g> <Esc>
inoremap <buffer> <C-g> <Esc>

if exists('*MyTerraformFormat')
        finish
endif

function MyTerraformFormat()
        update
	silent !terraform fmt -list=false >& /tmp/fmt.tf
	if -1 == match(readfile('/tmp/fmt.tf'), '\S')
		edit
	else
		below split term://less -R /tmp/fmt.tf
	endif
endfunction
