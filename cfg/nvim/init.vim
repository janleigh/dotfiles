"""""""""""""""""""""""""""""""""""""""""""""""""
"             GENERAL CONFIGURATION             "
"""""""""""""""""""""""""""""""""""""""""""""""""

" Set encoding
set encoding=utf8

" Set cursor
set guicursor=

" Set colorscheme
set termguicolors
colorscheme iceburg

" Enable mouse support
set mouse=a

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable ruler
set ruler

" Enable numbering of lines
set number 

" Enable syntax highlighting
syntax enable

" Enable auto indention
set ai

" Enable smart indention
set si

" Use spaces instead of tabs
set expandtab

" Make tabs smarter
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Turn off backups (cause I hate em)
set nobackup

" Turn off second status bar
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""
"              PLUGIN CONFIGURATION             "
"""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

" General Vim Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'Stoozy/vimcord'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'voldikss/vim-floaterm'

Plug 'akinsho/nvim-bufferline.lua'

Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Programming Languages Support Plugins
" Global
Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Python
Plug 'jeetsukumaran/vim-pythonsense'

" Rust
Plug 'rust-lang/rust.vim'

" GUI Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

call plug#end()

" Show NERDTree window
nmap <F6> :NvimTreeToggle<CR>
nmap <F18> :NvimTreeRefresh<CR>

" Show Floaterm
nmap <F5> :FloatermNew --height=0.6 --width=0.4 --wintype=float --name=Terminal --position=bottomright<CR>
nmap <F17> :FloatermKill!<CR>

" Set ALE
let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
    \   'javascript': ['eslint'],
    \   'typescript': ['eslint'],
    \ }

" Disablel YCM preview
set completeopt-=preview

" Init nvim-bufferline.lua
lua require'bufferline'.setup{}

" Set nvim-bufferline.lua keybinds
nmap <F2> :BufferLineCycleNext<CR>
nmap <F3> :BufferLineCyclePrev<CR>

" Set vim-airline theme
let g:airline_theme = 'minimalist'

" Bind a keybind to Telescope
nmap <F7> :Telescope find_files<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
"             HIGHLIGHT CONFIGURATION           "
"""""""""""""""""""""""""""""""""""""""""""""""""

" Floaterm
highlight FloatermBorder guibg=#13141d

" Bufferline
highlight BufferLineFill guibg=NONE

" nvim-tree
highlight NvimTreeRootFolder guifg=#89b8c2

"""""""""""""""""""""""""""""""""""""""""""""""""
"               LUA CONFIGURATION               "
"""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('telescope').setup{
    defaults = {
        prompt_position = "top",
        prompt_prefix = " ",
        selection_caret = " "
    }
} 
EOF
