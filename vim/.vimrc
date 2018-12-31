packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('scrooloose/nerdtree')
call minpac#add('chriskempson/base16-vim')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-dispatch')
call minpac#add('w0rp/ale')
call minpac#add('sgur/vim-editorconfig')
call minpac#add('pangloss/vim-javascript')
call minpac#add('elzr/vim-json')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'})
call minpac#add('carlitux/deoplete-ternjs')
call minpac#add('Shougo/denite.nvim')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('mustache/vim-mustache-handlebars')
call minpac#add('mxw/vim-jsx')
call minpac#add('mattn/emmet-vim')

command! PackUpdate source $MYVIMRC | redraw | call minpac#update()
command! PackClean source $MYVIMRC | call minpac#clean()

nnoremap <C-p> :<C-u>Denite file_rec<CR>

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

au BufNewFile,BufReadPost *.stache set syntax=mustache

let g:ale_sign_column_always = 1

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Use deoplete
let g:deoplete#enable_at_startup = 1

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

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \    'extends' : 'jsx',
    \  },
  \ }

let NERDTreeIgnore=['node_modules$[[dir]]', '\.git$[[dir]]']
