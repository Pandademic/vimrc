-- Just an example, supposed to be placed in /lua/custom/

local userPlugins = require "custom.plugins"

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "monokai",
}

M.plugins = {
    install = userPlugins,
    options = {
       lspconfig = {
          setup_lspconf = "custom.plugins.lspconfig",
       },
    },
    status = {
      alpha = true,
   },
}

M.options = {
  relativenumber = true,
}

return M
