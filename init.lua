--[[

- https://learnxinyminutes.com/docs/lua/
`:help lua-guide`
- https://neovim.io/doc/user/lua-guide.html

--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Fix for tailwindcss not working with htmldjango
-- vim.api.nvim_create_autocmd({"FileType"}, {
-- 	pattern = "htmldjango",
-- 	command = "set ft=html"
-- })
-- ---------------------------------------------------------------

require 'custom.pluginlist'
require 'custom.funcs'
require 'custom.options'
require 'custom.keymaps'
require 'custom.lsp'
require 'custom.after'

-- ---------------------------------------------------------------
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
