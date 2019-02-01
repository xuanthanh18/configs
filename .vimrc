set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tsaleh/vim-tmux'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'elzr/vim-json'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" execute pathogen#infect()
syntax on
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

set smarttab
set expandtab                       " use spaces, not tabs
set autoindent                      " set automatic code indentation
set hidden                          " allow background buffers w/out writing

set nowrap                          " don't wrap lines

set list                            " show hidden characters
set listchars=tab:\ \ ,trail:·      " show · for trailing space, \ \ for trailing tab
set spelllang=en,es                 " set spell check language
set noeb vb t_vb=                   " disable audio and visual bells

set t_Co=256                        " use 256 colors
set background=light

syntax enable
set encoding=utf8

set scrolloff=3                     " show 3 lines of context around the cursor
set autoread                        " set to auto read when a file is changed from the outside
set autowrite
set showcmd                         " show typed commands

set hlsearch                        " highlight search things
set incsearch                       " go to search results as typing
set smartcase                       " but case-sensitive if expression contains a capital letter.
set ignorecase                      " ignore case when searching
set gdefault                        " assume global when searching or substituting
set magic                           " set magic on, for regular expressions
set showmatch                       " show matching brackets when text indicator is over them

set lazyredraw                      " don't redraw screen during macros, faster
set ttyfast                         " improves redrawing for newer computers
set fileformats=unix,mac,dos
set ttymouse=xterm
set list listchars=tab:\ \ ,trail:·

set ts=2 sw=2 et
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0

nmap <silent> <F3> :SyntasticCheck<CR>
nmap <silent> <F4> :SyntasticReset<CR>

let g:indentLine_color_term = 239
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
" KEY MAPPINGS
nmap <silent> <F2> :NERDTreeToggle<CR>
:map Q <Nop>
:imap jk <Esc>
:imap <Capslock> <Esc>

" comment template

function! RubyComment()
  " ~/vim/cpp/new-class.txt is the path to the template file
  r~/.vim/template/ruby-comment.txt
endfunction

nmap <F7> :call RubyComment()<CR>
nmap =j :%!python -m json.tool<CR>

" remap keys so we can indent multiple times
vnoremap < <gv
vnoremap > >gv
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set backspace=indent,eol,start
