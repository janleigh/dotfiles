-- VIM OPTIONS
vim.cmd([[
  set guicursor=
]])
vim.opt.mouse = "a"

-- MAPPINGS
local map = require("core.utils").map
map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<C-w>", ":bd!<CR>")

-- CUSTOM PLUGINS
local customPlugins = require "core.customPlugins"
customPlugins.add(function(use)

   use {
      "github/copilot.vim",
      event = "BufEnter",
      config = function ()
         vim.g.copilot_no_tab_map = true
         vim.g.copilot_assume_mapped = true
      end
   }

   use { "andweeb/presence.nvim" }

end)
