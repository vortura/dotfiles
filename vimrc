filetype off
call pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on

set nocompatible

set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set directory=~/.vim/tmp/swap//   " swap files

" Vim 7.3 options
if version >= 703
    set colorcolumn=+1
    set undodir=~/.vim/tmp/undo//     " undo files
    set undofile
endif


"Macvim only settings
if has("gui_running")
    set guioptions=-t
    set relativenumber
endif


let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set wrap
set textwidth=80
set formatoptions=qrn1

" Show invisible chars by default
set listchars=tab:▸\ ,eol:¬
set list

inoremap jj <ESC>

au FocusLost * :wa

"Leader Mappings
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>l :set list!<CR>
nnoremap <leader>p :set paste!<CR>
let g:ctrlp_map = '<leader>,'

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Colorscheme {{
set background=dark
let g:solarized_termcolors=16

if !has("gui_running")
    let g:solarized_italic=0
endif

colorscheme solarized

"Invisible character colors
highlight NonText cterm=none guifg=#D9D9D9
highlight SpecialKey cterm=none guifg=#D9D9D9
syntax on
" }}

" Airline configuration
let g:airline_powerline_fonts = 1

" NERD Tree {{{

noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '.*\.pyc$', '.*.pid']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'

" }}}

" vim-processing
let g:use_processing_java = 1

" CtrlP
nnoremap <leader>. :CtrlP<CR>
nnoremap <leader><leader> :CtrlPBuffer<CR>

" Filetype detection
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.j2 set filetype=html
