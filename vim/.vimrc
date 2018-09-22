python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
set showtabline=2
set noshowmode

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'chriskempson/base16-vim'

call plug#end()

colorscheme base16-oceanicnext

set relativenumber
