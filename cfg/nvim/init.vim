"""""""""""""""""""""""""""""""""""""""""""""""""
"             GENERAL CONFIGURATION             "
"""""""""""""""""""""""""""""""""""""""""""""""""

" Set encoding
set encoding=utf8

" Set cursor
set guicursor=

" Set leaderkey
let mapleader=","

" Fix colorscheme
set termguicolors

" Enable mouse support
set mouse=a

" Enable filetype plugins
filetype plugin on
filetype indent on

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
" set nobackup

" Turn off second status bar
set noshowmode

" Turn off ruler (for clear dashboard)
set noruler

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

Plug 'voldikss/vim-floaterm'

" Miscellaneous Vim Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'karb94/neoscroll.nvim'

Plug 'glepnir/dashboard-nvim'

Plug 'gko/vim-coloresque'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'akinsho/nvim-bufferline.lua'

Plug 'alec-gibson/nvim-tetris'
Plug 'tweekmonster/startuptime.vim'
" Colors
Plug 'sainnhe/gruvbox-material'

call plug#end()

" Set colorscheme
let g:gruvbox_material_background = "hard"
colorscheme gruvbox-material

" Set NvimTree
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_auto_open = 0
let g:nvim_tree_git_hl = 1
let g:nvim_tree_ignore = [ ".cache", ".git", "node_modules", "data" ]

" Configure Dashboard
let g:dashboard_disable_statusline = 1
let g:dashboard_default_executive = "telescope"

nmap <Leader>fn :DashboardNewFile<CR>
nmap <Leader>q :q!<CR>

let g:dashboard_custom_header = [
    \ '',
    \ '⡿⠋⠄⣀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣌⠻⣿⣿',
    \ '⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠹⣿',
    \ '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹',
    \ '⣿⣿⡟⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⢿⣿⣿⣿⣮⠛⣿⣿⣿⣿⣿⣿⡆',
    \ '⡟⢻⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣣⠄⡀⢬⣭⣻⣷⡌⢿⣿⣿⣿⣿⣿',
    \ '⠃⣸⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⣆⢹⣿⣿⣿⡈⢿⣿⣿⣿⣿',
    \ '⠄⢻⡇⠄⢛⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿⡆⠹⣿⣆⠸⣆⠙⠛⠛⠃⠘⣿⣿⣿⣿',
    \ '⠄⠸⣡⠄⡈⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠁⣠⣉⣤⣴⣿⣿⠿⠿⠿⡇⢸⣿⣿⣿',
    \ '⠄⡄⢿⣆⠰⡘⢿⣿⠿⢛⣉⣥⣴⣶⣿⣿⣿⣿⣻⠟⣉⣤⣶⣶⣾⣿⡄⣿⡿⢸',
    \ '⠄⢰⠸⣿⠄⢳⣠⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⣿⣿⣿⣿⣿⣿⡇⢻⡇⢸',
    \ '⢷⡈⢣⣡⣶⠿⠟⠛⠓⣚⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⠇⠘',
    \ '⡀⣌⠄⠻⣧⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠛⠛⢿⣿⣿⣿⣿⣿⡟⠘⠄⠄',
    \ '⣷⡘⣷⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⡋⢀⣠⣤⣶⣶⣾⡆⣿⣿⣿⠟⠁⠄⠄⠄⠄',
    \ '⣿⣷⡘⣿⡀⢻⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣿⣿⣿⣿⣷⡿⠟⠉⠄⠄⠄⠄⡄⢀',
    \ '⣿⣿⣷⡈⢷⡀⠙⠛⠻⠿⠿⠿⠿⠿⠷⠾⠿⠟⣛⣋⣥⣶⣄⠄⢀⣄⠹⣦⢹⣿',
    \ '',
\ ]

let g:dashboard_custom_section = {
    \ 'book_marks': {
        \ 'description': [ "  Find File                 SPC f f" ],
        \ 'command': "Telescope find_files"
    \ },
    \ 'change_colorscheme': {
        \ 'description': [ "洛 New File                  SPC f n" ],
        \ 'command': "DashboardNewFile"
    \ },
    \ 'find_file': {
        \ 'description': [ "  Quit Neovim                 SPC q" ],
        \ 'command': "q!"
    \ }
\ }

let g:dashboard_custom_footer = [
    \ "Neovim v0.6.0"
\ ]

"""""""""""""""""""""""""""""""""""""""""""""""""
"             KEYBINDS CONFIGURATION            "
"""""""""""""""""""""""""""""""""""""""""""""""""

" ESC for turning off highlight searching
nmap <Esc> :noh<CR>

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
nmap <S-TAB> :BufferLineCycleNext<CR>
nmap <C-c> :bd!<CR>

" Telescope
nmap <Leader>ff :Telescope find_files<CR>
nmap <Leader>gt :Telescope git_status<CR>

" Floaterm
nmap <Leader>tn :FloatermNew --height=0.6 --width=0.4 --position=topright<CR>
nmap <Leader>tf :FloatermKill!<CR>
nmap <Leader>tt :FloatermToggle<CR>

nmap <F10> :Tetris<CR> 

" Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"""""""""""""""""""""""""""""""""""""""""""""""""
"               LUA CONFIGURATION               "
"""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOS
require('gitsigns').setup{}

require('bufferline').setup{
    options = {
        indicator_icon = "█",

        buffer_close_icon = "",

        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
    },
    highlights = {
        -- Focused Window
        buffer_selected = {
            guibg = "#282828",
            gui = "bold"
        },
        modified_selected = {
            guifg = "#A9B665",
            guibg = "#282828"
        },
        modified_visible = {
            guifg = "#EA6962"
        }
    }
}

require('nvim-web-devicons').setup{
    override = {
        js = {
            icon = "",
            color = "#FFC745",
            name = "js"
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
            return "█"
        end,
        highlight = { colors.cyan, colors.bgAlt }
    }
}

gls.left[2] = {
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

            local mode = alias[vim.fn.mode()]

            if mode == nil then
                return "  TERM "
            else
                return "  " .. mode .. " "
            end

        end,
        separator = "",
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
    LineColumn = {
        provider = "LineColumn",
        condition = buffer_not_empty,
        separator = " ",
        separator_highlight = { colors.bg, colors.bg },
        highlight = { colors.fg, colors.bg }
    }
}

gls.right[8] = {
    EndBorder = {
        provider = function()
            return "█"
        end,
        highlight = { colors.cyan, colors.bg }
    }
}

-- Short Line
--[[
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
]]--
EOS

"""""""""""""""""""""""""""""""""""""""""""""""""
"             HIGHLIGHT CONFIGURATION           "
"""""""""""""""""""""""""""""""""""""""""""""""""

" colorscheme
highlight LineNr guibg=#1d2021
highlight SignColumn guibg=#1d2021
highlight EndOfBuffer guifg=#1d2021

" coc.nvim
highlight CocErrorSign guifg=#EA6962
highlight CocWarningSign guifg=#FFC745
highlight CocInfoSign guifg=#7DAEA3

" dashboard
highlight DashboardHeader guifg=#a89984
highlight DashboardCenter guifg=#a89984
highlight DashboardShortcut guifg=#a89984
highlight DashboardFooter guifg=#a89984

" bufferline
highlight BufferLineFill guibg=NONE
highlight BufferLineSeparator guifg=bg guibg=NONE
highlight BufferLineCloseButtonSelected guibg=#282828

" nvim-tree
highlight NvimTreeFileDirty guifg=#EA6962
highlight NvimTreeGitDirty guifg=#EA6962
highlight NvimTreeRootFolder guifg=#7DAEA3
highlight NvimTreeVertSplit guifg=bg guibg=bg
highlight NvimTreeStatusLine guifg=#282828 guibg=bg
highlight NvimTreeStatusLineNC gui=underline guifg=#282828 guibg=bg
highlight NvimTreeEndOfBuffer guifg=#282828 guibg=#282828
highlight NvimTreeNormal guibg=#282828

" gitsigns
highlight GitSignsAdd guibg=#1d2021 guifg=#A9B665
highlight GitSignsChange guibg=#1d2021 guifg=#7DAEA3
highlight GitSignsChangeDelete guibg=#1d2021 guifg=#EA6962
highlight GitSignsDelete guibg=#1d2021 guifg=#EA6962

" floaterm
highlight FloatermBorder guibg=#1d2021

highlight StatusLineNC gui=underline guibg=NONE guifg=#282828
