set nocompatible              
filetype off        
" ===============================================
"                       Vundle
" ===============================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdcommenter'
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
" ===============================================
"                   End of Vundle
" ===============================================

syntax on                       " turn on syntax highlighting
set linebreak                   " if the line is too long, soft-wrap it to the next line
set wrapmargin=3                " num of chars before the end of screen to start wrapping
set number                      " turn on line numbering
set expandtab                   " no tabbing. <tab> is expanded into spaces
set tabstop=4                   " set tab to equal to four spaces
set shiftwidth=4                " set shift to four spaces 
set autoindent                  " turn on auto-indentation
set smartindent                 " turn on smart indent
set showcmd                     " show partial command in the last line of the screen
set backspace=indent,eol,start  " control behavor of backspace
set writebackup                 " make a backup before overwriting a file
set backup                      " create a backup file after each edit
set backupdir=~/.vim/backup         " store the backup file in this directory
set undofile                    " maintain undo history between sessions
set undodir=~/.vim/undodir
set visualbell                  " blink instead of beeping
set ruler                       " show information about the cursor
set laststatus=2                " always show the status line
set whichwrap=b,s,h,l,<,>,[,]   " which keys wraps the cursor to the next/prev line
set comments=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-,n:\: " what starts a line of comments
set nojoinspaces                " when we join two lines, no spacing inserted
set viminfo='100,<50,s10,h      " retains info across editing sessions
set matchpairs+=<:>             " add < > to pair matching;
set clipboard=autoselect,exclude:.*
set formatoptions+=r            " auto insert comment leader after hitting <enter> 
set guifont=LiberationMono\ 12  " nice font for gvim
set shortmess+=I                " disable the default welcome message
set ignorecase                  " case-insensitive search
set smartcase                   " becomes case-sensitive when search contains capital letter
set incsearch                   " seach as characters are entered
set hls                         " hightlight matches
set scrolloff=8                 " scroll offset = 8
set noerrorbells visualbell t_vb= "Disable error noises
set mouse+=a                    " Enable mouse support. 
set relativenumber

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
" inoremap <Left>  <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up>    <ESC>:echoe "Use k"<CR>
" inoremap <Down>  <ESC>:echoe "Use j"<CR>
"
imap jk <Esc>
nmap // :BLines<CR>
nmap <Up> :History:<CR>

" ab xx yy
" abbreviations: replace all xx with yy
ab fullname Hubertus Adhy Pratama Setiawan
ab docs /**/
" C++
ab incl #include <>
ab cout cout <<
ab cin cin >>

" Java
ab sout System.out.println("");<esc>2hi
ab psvm public static void main(String[] args) {<CR>}<esc>O

" NUS CS1010
ab pl cs1010_print_long(
ab pd cs1010_print_double(
ab ps cs1010_print_string("
