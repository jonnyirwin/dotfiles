call plug#begin()

Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'

call plug#end()

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

colorscheme base16-gruvbox-dark-hard
filetype plugin indent on
syntax on

" moving around, searching and patterns
set noautochdir " change directory to file in buffer
set nois " no incsearch - only match complete search term
set ignorecase
set smartcase

" displaying text
set number
set relativenumber
set cmdheight=2

" syntax, highlighting and spelling
set background=dark
set hlsearch
set cursorcolumn
set cursorline

" multiple windows
set hidden "don't unload a buffer when no longer shown in window
set laststatus=2

" multiple tab pages
set showtabline=2

" messages and info
set shortmess+=c
set noshowmode

" selecting text
set clipboard+=unnamedplus

" editing text
set undofile
set undodir=~/.config/nvim/undo

" tabs and indenting
set tabstop=2
set shiftwidth=2
set smarttab

" reading and writing files
set nobackup
set nowritebackup

" the swap file
set noswf

" multi-byte characters
set enc=utf-8

" various
set pyx=3
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" FZF settings
nnoremap <silent> <C-p> :<C-u>FZF<CR>
nnoremap <silent> <leader>b :<C-u>Buffers<CR>

" CoC settings
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> <leader>f :<C-u>Prettier<CR>
nnoremap <leader>a  <Plug>(coc-codeaction)
nnoremap <leader>x  <Plug>(coc-fix-current)

" vim-airline settings
let g:airline_powerline_fonts = 1

" write changes to buffers when lose focus
autocmd BufLeave,FocusLost * silent! wall

nnoremap <buffer> <leader>s :<C-u>w<CR> 
