"""""""""""""""""""""""""""""""""""""""""""""""""
"             GENERAL CONFIGURATION             "
"""""""""""""""""""""""""""""""""""""""""""""""""

" Set encoding
set encoding=utf8

" Set cursor
set guicursor=

" Fix colorscheme
set termguicolors

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

" Colors
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

call plug#end()

" Set colorscheme
let g:gruvbox_material_background = "hard"
colorscheme gruvbox-material

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
nmap <F6> :NvimTreeRefresh<CR>

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
            guibg = "#282828",
            gui = "bold"
        },
        modified_selected = {
            guibg = "#282828"
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
    bg = "#1d2021",
    fg = "#f1fdc7",

    bgAlt = "#282828",

    red = "#EA6962",
    green = "#A9B665",
    yellow = "#FFC745",
    cyan = "#7DAEA3"
}

gl.short_line_list = { "NvimTree" }

gls.left[1] = {
    StartBorder = {
        provider = function()
            return "▋"
        end,
        highlight = { colors.cyan, colors.bg }
    }
}

gls.left[2] = {
    ViMode = {
        provider = function()

            local alias = {
                n = '  NORMAL',
                i = '  INSERT',
                c = '  COMMAND',
                V = '  VISUAL',
                [''] = '  VISUAL',
                v = '  VISUAL',
                R = '  REPLACE',
            }

            return alias[vim.fn.mode()]

        end,
        separator = " ",
        separator_highlight = { colors.bgAlt, colors.bgAlt },
        highlight = { colors.fg, colors.bgAlt }
    }
}

gls.left[3] = {
    Separator = {
        provider = function()
            return " "
        end,
        highlight = { colors.bg, colors.bg }
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
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        separator = " ",
        separator_highlight = { colors.bgAlt, colors.bgAlt },
        highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bgAlt }
    }
}

gls.right[6] = {
    FileName = {
        provider = "FileName",
        condition = buffer_not_empty,
        highlight = { colors.fg, colors.bgAlt }
    }
}

gls.right[7] = {
    EndBorder = {
        provider = function()
            return "▋"
        end,
        separator = " ",
        separator_highlight = { colors.bgAlt, colors.bgAlt },
        highlight = { colors.cyan, colors.bg }
    }
}

-- Short Line

gls.short_line_left[1] = {
    Space = {
        provider = function()
            return " "
        end,
    }
}

gls.short_line_left[2] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
    }
}

gls.short_line_left[3] = {
    FileName = {
        provider = "FileName",
        condition = buffer_not_empty,
        separator = " "
    }
}

EOS

"""""""""""""""""""""""""""""""""""""""""""""""""
"             HIGHLIGHT CONFIGURATION           "
"""""""""""""""""""""""""""""""""""""""""""""""""

" colorscheme
highlight LineNr guibg=#1d2021

" coc.nvim
highlight CocErrorSign guifg=#EA6962
highlight CocWarningSign guifg=#FFC745

" floaterm
highlight FloatermBorder guibg=#1d2021

" bufferline
highlight BufferLineFill guibg=NONE

" nvim-tree
highlight NvimTreeFileDirty guifg=#EA6962
highlight NvimTreeGitDirty guifg=#EA6962
highlight NvimTreeRootFolder guifg=#7DAEA3

highlight StatusLineNC gui=underline guibg=NONE guifg=#282828
