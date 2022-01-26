local M = {}

M.bufferline = {
    highlights = {
        fill = {
            guibg = "#101415"
        },
        separator = {
            guibg = "#101415"
        }
    }
}

M.treesitter = {
    ensure_installed = {
        "html",
        "css",
        "javascript",
        "lua",
        "vim"
    }
}

M.nvimtree = {
    auto_close = true,
    filters = {
       custom = {
          "node_modules"
       }
    },
    view = {
        width = 30
    }
}

return M