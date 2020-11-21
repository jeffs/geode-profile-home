" This is my vimrc.  There are many vimrcs like it, but this one is mine.

" Use space as leader key so right pinky needn't reach for backslash.
let mapleader = " "

" Save hundreds of left-pinky keystrokes per day.
inoremap <C-g> <Esc>

" Swap ; with : (which is Shift+;) to save hundreds more left-pinky keystrokes per day.
nnoremap : ;
nnoremap ; :
nnoremap q: q;
nnoremap q; q:
vnoremap : ;
vnoremap ; :
vnoremap q: q;
vnoremap q; q:

" This one saves all fingers involved in C-^ _except_ the left pinky.
nnoremap <Tab> <C-^>

" Toggle line numbering or wrapping.
nnoremap <silent> <C-n> :setlocal number!<CR>
nnoremap <silent> <C-_> :setlocal wrap!<CR>

" Edit the previous/next file.
nnoremap <silent> <Left> :previous<CR>
nnoremap <silent> <Right> :next<CR>

" Open a curly brace delimited block.
inoremap <silent> <C-j> <Esc>:s/\s*{\=\s*$//<CR>A {<CR>}<C-o>O

" Buffer management.
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :up<CR>
autocmd TermOpen * nnoremap <buffer> <nowait> q :bw!<CR>
autocmd TermOpen * nnoremap <buffer> <Leader>q :bw!<CR>

" Omnicomplete.
highlight Pmenu ctermbg=darkgray
highlight PmenuSel ctermbg=blue ctermfg=white

" Line wrapping
let &showbreak = nr2char(0x230a)        " prefix soft-wrapped lines with ⌊
set breakindent breakindentopt+=shift:2 " indent wrapped lines
set linebreak                           " don't wrap lines

" Case sensitivity
set ignorecase  " case-insensitive search
set smartcase   "       unless the pattern includes a capital letter
set infercase   "       adjusting automplete results to match pattern
set nohlsearch  " don't highlight search results

" Offline storage
set hidden                      " allow hiding of buffers with unsaved changes
set undofile                    " preserve undo history between sessions
set undodir=~/var/nvim/undo
set viewdir=~/var/nvim/view
set viminfo+=n~/var/nvim/info
set backupdir=~/var/nvim/back,.
set directory=~/var/nvim/swap,.
set spellfile=~/var/nvim/spell/spellfile.utf8.add

" Desktop integration
set visualbell                  " flash instead of blinking

" NOTE: This setting breaks rectangular yank/put.
set clipboard+=unnamedplus      " map "+ register to system clipboard

" Convenience
nnoremap Y y$
abbrev 0vomit 🤮
abbrev 0yin_yang ☯️

" Tmux integration: Send a line, paragraph, or selection to the bottom pane.
nnoremap <silent> <C-j>     :.w      !tmux-send<CR><CR>j
nnoremap <silent> <Leader>e vap:w    !tmux-send<CR><CR>}
vnoremap <silent> <Leader>e :w       !tmux-send<CR><CR>

" Plugin integration
set runtimepath+=~/opt/fzf  " https://github.com/junegunn/fzf
nnoremap <silent> <Leader>o :FZF<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
vnoremap <silent> <Leader>t :<C-u>execute "'<,'>!tabulate" v:count<CR>
let g:is_bash = 1
