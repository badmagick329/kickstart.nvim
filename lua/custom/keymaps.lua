local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

local nrmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc, remap = true })
end

-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Close buffer
vim.keymap.set( 'n', '<leader>c', '<cmd>bd<cr>', { desc = 'Close buffer', silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move stuff with J and K in v mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Move to windows using ctrl + hjkl
nrmap('<C-h>', '<C-w>h', 'Go to left window')
nrmap('<C-j>', '<C-w>j', 'Go to lower window')
nrmap('<C-k>', '<C-w>k', 'Go to upper window')
nrmap('<C-l>', '<C-w>l', 'Go to right window')

-- Do not put stuff in registers for these
vim.keymap.set('x', 'p', [["_dP]])
vim.keymap.set({ 'x', 'n' }, 'x', [["_x]])
vim.keymap.set({ 'x', 'n' }, 'C', [["_C]])

-- Diagnostic keymaps
nmap('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
nmap(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
nmap('<leader>q', vim.diagnostic.setloclist, 'Open diagnostics list')

-- function signature help in insert mode
local opts = { noremap = true, silent = true }
vim.keymap.set('i', '<C-h>', function()
  vim.lsp.buf.signature_help()
end, opts)

-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- better scrolling: keep cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- [[ LazyGit ]]
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

-- [[ formatter.nvim ]]
vim.keymap.set('n', '<leader>lf', '<cmd>Format<cr>', { desc = '[F]ormat Buffer' })

-- [[ vim-tmux-navigator ]]
vim.keymap.set('n', '<C-h>', ':<C-U>TmuxNavigateLeft<CR>', { silent = false, remap = true })
vim.keymap.set('n', '<C-j>', ':<C-U>TmuxNavigateDown<CR>', { silent = false, remap = true })
vim.keymap.set('n', '<C-k>', ':<C-U>TmuxNavigateUp<CR>', { silent = false, remap = true })
vim.keymap.set('n', '<C-l>', ':<C-U>TmuxNavigateRight<CR>', { silent = false, remap = true })

-- [[ Telescope Keymaps ]]
local tbuiltin = require 'telescope.builtin'
local actions = require 'telescope.actions'
nmap('<leader>?', tbuiltin.oldfiles, '[?] Find recently opened files')
nmap('<leader><space>', tbuiltin.buffers, '[ ] Find existing buffers')
nmap('<leader>/', function()
  tbuiltin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, '[/] Fuzzily search in current buffer')

nmap('<leader>gf', tbuiltin.git_files, 'Search [G]it [F]iles')
nmap('<leader>sf', function()
  tbuiltin.find_files { hidden = true, no_ignore = true }
end, '[S]earch [F]iles')
nmap('<leader>sh', tbuiltin.help_tags, '[S]earch [H]elp')
nmap('<leader>sw', tbuiltin.grep_string, '[S]earch current [W]ord')
nmap('<leader>st', tbuiltin.live_grep, '[S]earch [T]ext')
nmap('<leader>sd', tbuiltin.diagnostics, '[S]earch [D]iagnostics')
nmap('<leader>sr', tbuiltin.resume, '[S]earch [R]resume')

-- [[ Harpoon Keymaps ]]
local hui = require 'harpoon.ui'
local hmark = require 'harpoon.mark'

nmap('<leader>kk', hui.toggle_quick_menu, 'Harpoon Quickmenu')
nmap('<leader>ka', hmark.add_file, 'Add file')
-- stylua: ignore start
nmap('<leader>kq', function() hui.nav_file(1) end, 'Go to File 1')
nmap('<leader>kw', function() hui.nav_file(2) end, 'Go to File 2')
nmap('<leader>ke', function() hui.nav_file(3) end, 'Go to File 3')
nmap('<leader>kr', function() hui.nav_file(4) end, 'Go to File 4')
nmap('<leader>kt', function() hui.nav_file(5) end, 'Go to File 5')
-- stylua: ignore end

-- [[ Spectre Keymaps ]]
local spectre = require 'spectre'
nmap('<leader>Ss', spectre.open, 'Spectre')
nmap('<leader>Sw', function()
  spectre.open_visual { select_words = true }
end, 'Spectre')
nmap('<leader>Sf', spectre.open_file_search, 'Spectre')

-- [[ repl Keymaps ]]
nmap('<leader>ii', '<cmd>ReplToggle<cr>', 'Toggle Repl')
nmap('<leader>ir', '<cmd>ReplRunCell<cr>', 'Run Cell')

-- [[ undo tree ]]
nmap('<leader>u', '<cmd>UndotreeToggle<cr>', 'Toggle UndoTree')

-- [[ Trouble ]]
nmap('<leader>tt', function()
  require('trouble').open()
end, 'Toggle Trouble')
nmap('<leader>tw', function()
  require('trouble').open 'workspace_diagnostics'
end, 'Workspace Diagnosis')
nmap('<leader>td', function()
  require('trouble').open 'document_diagnostics'
end, 'Document Diagnosis')
nmap('<leader>tq', function()
  require('trouble').open 'quickfix'
end, 'Open quickfix')
nmap('<leader>tl', function()
  require('trouble').open 'loclist'
end, ' Open loclist')
nmap('gR', function()
  require('trouble').open 'lsp_references'
end, 'LSP References')

-- Make n always search forward
-- vim.keymap.set('n', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
-- vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
-- vim.keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
-- vim.keymap.set('n', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
-- vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
-- vim.keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- [[ Bufferline ]]
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycle to next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Cycle to prev buffer" })