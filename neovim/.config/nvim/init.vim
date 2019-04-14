call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-projectionist'
Plug 'w0rp/ale'
Plug 'sgur/vim-editorconfig'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'Shougo/denite.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

call plug#end()

nnoremap <C-p> :<C-u>Denite file/rec<CR>
call denite#custom#var('file/rec', 'command',
 \ ['rg', '--files', '--glob', '!.git'])
call denite#custom#map(
	      \ 'insert',
 	      \ '<C-j>',
	      \ '<denite:move_to_next_line>',
	      \ 'noremap'
	      \)
call denite#custom#map(
	      \ 'insert',
 	      \ '<C-k>',
 	      \ '<denite:move_to_previous_line>',
 	      \ 'noremap'
\)

let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
let g:UltiSnipsExpandTrigger='<C-q>'
let g:UltiSnipsListSnippet='<C-w>'
let g:UltiSnipsJumpForwardTrigger='<C-b>'
let g:UltiSnipsJumpBackwardTrigger='<C-z>'
let g:UltiSnipsEditSplit="vertical"

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
set noswapfile

filetype plugin on

let g:ale_sign_column_always = 1

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Use deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'tern']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

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

command! Wq wq
command! W w
