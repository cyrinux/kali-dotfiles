""""""""""""""""""""""""""""""""""""""""""""""
"
" ##     ## #### ##     ## ########   ######
" ##     ##  ##  ###   ### ##     ## ##    ##
" ##     ##  ##  #### #### ##     ## ##
" ##     ##  ##  ## ### ## ########  ##
"  ##   ##   ##  ##     ## ##   ##   ##
"   ## ##    ##  ##     ## ##    ##  ##    ##
"    ###    #### ##     ## ##     ##  ######
"
""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""
"
" vim configuration file
" ----------------------
"
" Version: 0.50_kali - 2018/10/07 19:56:57
" Author: Brainfuck
"
" https://github.com/brainfucksec/dotfiles
"
""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""

" Don't try to be vi compatible
set nocompatible

" Enable filetype detection
filetype on

" Enable filetype-specific plugin then indent
filetype plugin indent on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before plugin manager starts loading all
" the plugins.
let mapleader = ","

" vimwiki
let g:vimwiki_list = [{'path': '~/documents/vimwiki/index.wiki'}]


""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
""""""""""""""""""""""""""""""""""""""""""""""

" Turn on syntax highlighting
syntax on

" Set ctermbg to none
highlight NonText ctermbg=none

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" No flashing or beeping at all
set noerrorbells
set visualbell
set t_vb=

" Add a bit extra margin to the left
"set foldcolumn=1

" Show line number
set number

" Folding settings
set foldmethod=marker
set foldmarker={{,}}

" Highlight current line
"set cursorline

" Highlight matching parenthesis
set showmatch

" Show command in bottom bar
set showcmd

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e


""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""

" Terminal settings
set t_Co=256
"set termguicolors

" Colorscheme
" colorscheme from pywal
colorscheme wal
set background=dark

" Extend background color to the whole screen (xfce4-terminal fix)
set t_ut=

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8


""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups
""""""""""""""""""""""""""""""""""""""""""""""""

" Use Unix for new files and autodetect the rest
set ffs=unix,dos,mac

" Force Markdown syntax
autocmd BufRead,BufNew *.md set filetype=markdown

" Turn backup off, swap file off
set nobackup
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""
" => Memory, CPU
""""""""""""""""""""""""""""""""""""""""""""

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Sets how many lines of history VIM has to remember
set history=100


""""""""""""""""""""""""""""""""""""""""""""
" => Text, tabs, indent
""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Insert spaces for tabs according to shiftwidth
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" 1 tab == 2 spaces for selected filetypes
autocmd FileType xml,html,xhtml setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNew *.css setlocal shiftwidth=2 tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" indentLine: indent lines style
let g:indentLine_char = '│'
"let g:indentLine_setColors = 0


""""""""""""""""""""""""""""""""""""""""""""
" => Autocompletion, linting
""""""""""""""""""""""""""""""""""""""""""""

" Completion popup settings (:help 'completeopt')
set completeopt+=menuone,noinsert,noselect

" Shut off completion messages
set shortmess+=c

" MUComplete
let g:mucomplete#enable_auto_at_startup = 1

" endwise compatibility
imap <Plug>MyCR <Plug>(MUCompleteCR)


" ALE (Linter)
let g:ale_enabled = 1

" Run linter only after save the file
let g:ale_lint_on_text_changed = 'never'

" Don't run linter after open a file
let g:ale_lint_on_enter = 0

" Navigate between errors
nmap <silent> <C-k> <Plug>
nmap <silent> <C-j> <Plug>


""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2


" lightline
" Disable mode information under status line
set noshowmode

" Set colorscheme
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ }


""""""""""""""""""""""""""""""""""""""""""""
" => Keymapping
""""""""""""""""""""""""""""""""""""""""""""

" Reload vim config without restart
map \r :source ~/.vimrc<CR>

" Cancel a search with Ctrl+l
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Make jj do Esc
inoremap jj <Esc>

" Don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Fast saving
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" NerdTree
" Open NerdTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Show hidden files
"let NERDTreeShowHidden=1
