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
Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }

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

" ;)
Plug 'willelz/badapple.nvim'

call plug#end()

" Set NvimTree
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_auto_open = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_ignore = [ ".cache", ".git", "node_modules", "data" ]

"""""""""""""""""""""""""""""""""""""""""""""""""
"             KEYBINDS CONFIGURATION            "
"""""""""""""""""""""""""""""""""""""""""""""""""

" Quick window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Make new window
nmap <C-a> :vsplit<CR>
nmap <C-s> :split<CR>

" Open terminal
nmap <S-a> :vsplit term://zsh<CR>
nmap <S-s> :split term://zsh<CR>

" nvim-tree
nmap <C-n> :NvimTreeToggle<CR>

" nvim-bufferline.lua
nmap <S-n> :BufferLineCycleNext<CR>

" Telescope
nmap <F7> :Telescope find_files<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
"               LUA CONFIGURATION               "
"""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOS
require('gitsigns').setup{}

require('bufferline').setup{
    options = {
        max_name_length = 14,
    },
    highlights = {
        -- Focused Window
        buffer_selected = {
            guibg = "#191C2A",
            gui = "bold"
        },
        modified_selected = {
            guibg = "#191C2A"
        }
    }
}

require('telescope').setup{
    defaults = {
        prompt_position = "top",
        prompt_prefix = " ",
        selection_caret = " "
    }
}
EOS

lua << EOS
local gl = require("galaxyline")
local gls = gl.section

local colors = {
    bg = "#13141d",
    fg = "#cfd1dd",

    bgAlt = "#191C2A",

    red = "#e27878",
    green = "#a3be8c",
    yellow = "#ebcb8b",
    cyan = "#89b8c2"
}

gl.short_line_list = {" "}

gls.left[1] = {
    StartBorder = {
        provider = function()
            return "▋"
        end,
        highlight = { colors.cyan, colors.bg }
    }
}

gls.left[2] = {
    Separator = {
        provider = function()
            return " "
        end,
        highlight = { colors.bg, colors.bg }
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg }
    }
}

gls.left[4] = {
    FileName = {
        provider = "FileName",
        condition = buffer_not_empty,
        highlight = { colors.fg, colors.bg }
    }
}

gls.right[1] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.yellow, colors.bg }
    }
}

gls.right[2] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.red, colors.bg }
    }
}

gls.right[3] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = { colors.red, colors.bg }
    }
}


gls.right[4] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = { colors.yellow, colors.bg }
    }
}

gls.right[5] = {
    ViMode = {
        provider = function()

            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c = 'COMMAND',
                V = 'VISUAL',
                [''] = 'VISUAL',
                v = 'VISUAL',
                R = 'REPLACE',
            }

            return alias[vim.fn.mode()]

        end,
        separator = " ",
        separator_highlight = { colors.bgAlt, colors.bgAlt },
        highlight = { colors.fg, colors.bgAlt },
    }
}

gls.right[6] = {
    EndBorder = {
        provider = function()
            return "▋"
        end,
        separator = " ",
        separator_highlight = { colors.bgAlt, colors.bgAlt },
        highlight = { colors.cyan, colors.bg }
    }
}
EOS

"""""""""""""""""""""""""""""""""""""""""""""""""
"             HIGHLIGHT CONFIGURATION           "
"""""""""""""""""""""""""""""""""""""""""""""""""

" coc.nvim
highlight CocErrorSign guifg=#e27878
highlight CocWarningSign guifg=#ebcb8b

" floaterm
highlight FloatermBorder guibg=#13141d

" bufferline
highlight BufferLineFill guibg=NONE

" nvim-tree
highlight NvimTreeFileDirty guifg=#e27878
highlight NvimTreeGitDirty guifg=#e27878
highlight NvimTreeRootFolder guifg=#89b8c2

highlight StatusLineNC gui=underline guibg=NONE guifg=#383c44
