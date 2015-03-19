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
let maplocalleader = "\\"

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
" YAML {{{

augroup ft_yaml
    au!

    au FileType yaml set shiftwidth=2
augroup END

" }}}
" tslime {{{

let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<localleader>t'
let g:tslime_visual_mapping = '<localleader>t'
let g:tslime_vars_mapping = '<localleader>T'

" }}}

" Scheme {{{
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt
" }}}

" vim-processing
let g:use_processing_java = 1

" CtrlP
nnoremap <leader>. :CtrlP<CR>
nnoremap <leader><leader> :CtrlPBuffer<CR>

" Filetype detection
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.j2 set filetype=html

" Highlight comments in italics
highlight Comment cterm=italic

let s:uname = system("echo -n \"$(uname)\"")
"if !v:shell_error && s:uname == "Linux"
"    set t_ZH=[3m
"    set t_ZR=[23m
"endif

let g:niji_dark_colours = [
  \ [ '81', '#5fd7ff'],
  \ [ '99', '#875fff'],
  \ [ '1',  '#dc322f'],
  \ [ '76', '#5fd700'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]

let g:paredit_electric_return = 1
let g:SuperTabCrMapping = 0
