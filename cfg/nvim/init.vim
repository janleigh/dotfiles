"""""""""""""""""""""""""""""""""""""""""""""""""
"             GENERAL CONFIGURATION             "
"""""""""""""""""""""""""""""""""""""""""""""""""

" Set encoding
set encoding=utf8

" Set cursor
set guicursor=

" Set colorscheme
set termguicolors

" Refer to https://github.com/TheRealKizu/kizu.vim
colorscheme kizu 

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

" Change update time for coc.nvim
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""
"              PLUGIN CONFIGURATION             "
"""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

" Programming Languages Support Plugins
" Global
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Lua
Plug 'tjdevries/nlua.nvim'
Plug 'euclidianAce/BetterLua.vim'
" Rust
Plug 'rust-lang/rust.vim'

" Git Plugins
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'

" GUI Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" Miscellaneous Vim Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'gko/vim-coloresque'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'akinsho/nvim-bufferline.lua'
Plug 'voldikss/vim-floaterm'

call plug#end()

" Set NvimTree
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_auto_open = 1
let g:nvim_tree_git_hl = 1

" Set vim-airline theme
let g:airline_theme = 'kizu'

"""""""""""""""""""""""""""""""""""""""""""""""""
"             KEYBINDS CONFIGURATION            "
"""""""""""""""""""""""""""""""""""""""""""""""""

" New vertical window
nmap <F4> :vnew<CR>

" Resize window by 5%
nmap <F9> :vertical resize 5<CR>
nmap <F10> :vertical resize -5<CR>

" nvim-tree
nmap <F6> :NvimTreeToggle<CR>
nmap <F18> :NvimTreeRefresh<CR>

" floaterm
nmap <F5> :FloatermNew --height=0.6 --width=0.4 --wintype=float --name=Terminal --position=bottomright<CR>
nmap <F17> :FloatermKill!<CR>

" nvim-bufferline.lua
nmap <F2> :BufferLineCycleNext<CR>
nmap <F3> :BufferLineCyclePrev<CR>

" Telescope
nmap <F7> :Telescope find_files<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
"               LUA CONFIGURATION               "
"""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require('gitsigns').setup{}

require('bufferline').setup{}

require('telescope').setup{
    defaults = {
        prompt_position = "top",
        prompt_prefix = " ",
        selection_caret = " "
    }
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""
"             HIGHLIGHT CONFIGURATION           "
"""""""""""""""""""""""""""""""""""""""""""""""""

" floaterm
highlight FloatermBorder guibg=#13141d

" bufferline
highlight BufferLineFill guibg=NONE

" nvim-tree
highlight NvimTreeFileDirty guifg=#e27878
highlight NvimTreeGitDirty guifg=#e27878
highlight NvimTreeRootFolder guifg=#89b8c2

