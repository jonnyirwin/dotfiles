packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('scrooloose/nerdtree')
call minpac#add('chriskempson/base16-vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('christoomey/vim-tmux-navigator')

command! PackUpdate source $MYVIMRC | redraw | call minpac#update()
command! PackClean source $MYVIMRC | call minpac#clean()

"function s:MkNonExDir(file, buf)
"    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
"        let dir=fnamemodify(a:file, ':h')
"        if !isdirectory(dir)
"            call mkdir(dir, 'p')
"        endif
"    endif
"endfunction
"augroup BWCCreateDir
"    autocmd!
"    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
"  augroup END

colorscheme base16-oceanicnext
syntax on

set number relativenumber
set laststatus=2
set showtabline=2
set tabstop=2
set shiftwidth=2
set expandtab
set noshowmode
set ignorecase
set hlsearch
set undofile
set undodir=~/.vim/undo

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

let g:airline_theme='base16_oceanicnext'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

let NERDTreeIgnore=['node_modules$[[dir]]', '\.git$[[dir]]']

command! Wq wq
command! W w
