local pluginConfs = require "custom.plugins.configs"
local M = {}

M.plugins = {
   default_plugin_config_replace = {
      -- bufferline = pluginConfs.bufferline,
      nvim_treesitter = pluginConfs.treesitter,
      nvim_tree = pluginConfs.nvimtree
   }
}

M.ui = {
   theme = "skotadi",
   -- hl_override = "custom.highlights",
   italic_comments = true,
}

return M
