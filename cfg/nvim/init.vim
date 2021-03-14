"""""""""""""""""""""""""""""""""""""""""""""""""
"             GENERAL CONFIGURATION             "
""""""""""""""""""""""""""""""""""""""""""""""'""

" Set encoding
set encoding=utf8

" Set cursor
set guicursor=

" Fix colorscheme
set termguicolors
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

"""""""""""""""""""""""""""""""""""""""""""""""""
"              PLUGIN CONFIGURATION             "
""""""""""""""""""""""""""""""""""""""""""""""'""

call plug#begin('~/.local/share/nvim/plugged')

" General Vim Plugins
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'Stoozy/vimcord'

Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Programming Languages Support Plugins
" Global
Plug 'dense-analysis/ale'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Python
Plug 'jeetsukumaran/vim-pythonsense'

" Rust
Plug 'rust-lang/rust.vim'

" GUI Plugins
Plug 'ntk148v/vim-horizon'

Plug 'romgrk/barbar.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

call plug#end()

" Show NERDTree window
nmap <F6> :NERDTreeToggle<CR>

" Set ALE
let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
    \   'javascript': ['eslint'],
    \   'typescript': ['eslint'],
    \ }

" Disablel YCM preview
let g:ycm_add_preview_to_completeopt = 1

" Set colorscheme
" colorscheme horizon

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Disable barbar notifications
let bufferline.icons = v:false

" Change bufferline icons
let bufferline.icon_separator_active = ' '
let bufferline.icon_separator_inactive = ' '

" Set barbar.nvim keybinds
nmap <F2> :BufferPrevious<CR>
nmap <F2> :BufferNext<CR>

" Set vim-airline font
let g:airline_powerline_fonts = 1

" Set vim-airline theme
let g:airline_theme='minimalist'

" Bind a keybind to Telescope
nmap <F7> :Telescope<CR>