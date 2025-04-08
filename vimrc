" move cursor everyedit; add whitespace if needed when editing
set virtualedit=all

" Don't try to be vi compatible
set nocompatible

" Show line numbers
set number

" Show file stats
"set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set linebreak
"set textwidth=0
"set wrapmargin=0
"set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
"set noshiftround
set autoindent
set smartindent
set showmatch

" Cursor motion
"set scrolloff=8
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
"runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
"set hidden

" Rendering
set ttyfast

set ignorecase

" Visualize tabs and newlines
"set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

set undodir=~/.vim/undodir
set undofile

set incsearch
set hlsearch

set foldmethod=indent
set foldnestmax=3
set nofoldenable
set foldlevel=20


" turn off search highlighting with control-l
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>

" delete buffer (and move to previous buffer) without closing tab
"noremap <leader>p :bp \| bd # <return>
"noremap <leader>n :bn \| bd # <return>

" remove any trailing whitespace on save
autocmd BufWrite * :%s/\s\+$//e



" theme
syntax on
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_invert_selection = 1
let g:gruvbox_invert_signs = 1
let g:gruvbox_invert_tabline = 1

" file navigator
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * silent NERDTreeMirror
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute \"normal! \<C-W>w\" | execute 'buffer'.buf | endif

let b:ale_fixers = ['black', 'isort']
let b:ale_fix_on_save = 1
