local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

local nrmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc, remap = true })
end

-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Save
vim.keymap.set({ 'n', 'v', 'i', 'x' }, '<C-s>', '<cmd>w<cr>', { silent = true })
-- Select full function
vim.keymap.set('n', 'vaf', 'vafo0oj', { silent = true, remap = true })
vim.keymap.set('n', 'vif', 'vifo0oj', { silent = true, remap = true })

-- Close buffer
vim.keymap.set('n', '<leader>c', '<cmd>bdelete!<cr>', { desc = 'Close buffer', silent = true })
-- Close all except current buffer
-- Vim version
vim.keymap.set('n', '<leader>C', '<cmd>%bdelete|edit#|bdelete#<cr>', { desc = 'Close all except current buffer', silent = true })
-- vim.keymap.set('n', '<leader>C', CloseAllExceptCurrent, { desc = 'Close all except current buffer', silent = true })

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

-- Comment and uncomment lines

-- vim.keymap.set('n', '<leader>lc', '<cmd>lua cprints()<cr>', { desc = 'Comment print statements', silent = true })
-- vim.keymap.set('n', '<leader>lC', '<cmd>lua uprints()<cr>', { desc = 'Uncomment print statements', silent = true })

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
vim.keymap.set('n', '<leader>lf', '<cmd>Format<cr>', { desc = 'Format Buffer' })

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

nmap('<leader>gf', tbuiltin.git_files, 'Telescope: Git Files')
nmap('<leader>sf', function()
  tbuiltin.find_files { hidden = true, no_ignore = true }
end, 'Telescope: Files')
nmap('<leader>sh', tbuiltin.help_tags, 'Telescope: Help')
nmap('<leader>sw', tbuiltin.grep_string, 'Telescope: Current Word')
nmap('<leader>st', tbuiltin.live_grep, 'Telescope: Text')
nmap('<leader>sd', tbuiltin.diagnostics, 'Telescope: Diagnostics')
nmap('<leader>sr', tbuiltin.resume, 'Telescope: Rresume')

-- [[ Harpoon Keymaps ]]
local hui = require 'harpoon.ui'
local hmark = require 'harpoon.mark'

nmap('<leader>kk', hui.toggle_quick_menu, 'Harpoon Quickmenu')
nmap('<leader>ka', hmark.add_file, 'Add file')
-- stylua: ignore start
nmap('<leader>kq', function() hui.nav_file(1) end, 'Harpoon: File 1')
nmap('<leader>kw', function() hui.nav_file(2) end, 'Harpoon: File 2')
nmap('<leader>ke', function() hui.nav_file(3) end, 'Harpoon: File 3')
nmap('<leader>kr', function() hui.nav_file(4) end, 'Harpoon: File 4')
nmap('<leader>kt', function() hui.nav_file(5) end, 'Harpoon: File 5')
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
-- stylua: ignore start
local trouble = require('trouble')
nmap('<leader>tt', function() trouble.open() end, 'Trouble: Toggle Trouble')
nmap('<leader>tw', function() trouble.open 'workspace_diagnostics' end, 'Trouble: Workspace Diagnosis')
nmap('<leader>td', function() trouble.open 'document_diagnostics' end, 'Trouble: Document Diagnosis')
nmap('<leader>tq', function() trouble.open 'quickfix' end, 'Trouble: Open quickfix')
nmap('<leader>tl', function() trouble.open 'loclist' end, 'Trouble: Open loclist')
nmap('gR', function() trouble.open 'lsp_references' end, 'Trouble: LSP References')
-- stylua: ignore end

-- Make n always search forward - Maybe I don't like it?
-- vim.keymap.set('n', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
-- vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
-- vim.keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
-- vim.keymap.set('n', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
-- vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
-- vim.keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- [[ Bufferline ]]
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Bufferline: Cycle to next buffer' })
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Bufferline: Cycle to prev buffer' })

-- [[ ToggleTerm ]]
-- nmap('<leader>rq', '<cmd>1ToggleTerm size=20 direction=horizontal<cr>', 'ToggleTerm: Horizontal Terminal 1')
-- nmap('<leader>rw', '<cmd>2ToggleTerm size=80 direction=vertical<cr>', 'ToggleTerm: Vertical Terminal 2')
-- nmap('<leader>re', '<cmd>3ToggleTerm direction=float<cr>', 'ToggleTerm: Floating Terminal 3')

-- [[ Todo Comments ]]
nmap('<leader>sc', '<cmd>TodoTelescope<cr>', 'TodoComments: Telescope')
nmap('<leader>sx', '<cmd>TodoTrouble<cr>', 'TodoComments: Trouble')

-- [[ Dap Keybinds ]]
local dap = require 'dap'
local dapui = require 'dapui'
-- stylua: ignore start
nmap('<F5>', function() dap.continue() end, 'Debug: Continue')
nmap('<F10>', function() dap.step_into() end, 'Debug: Step Into')
nmap('<F11>', function() dap.step_over() end, 'Debug: Step Over')
nmap('<F12>', function() dap.step_out() end, 'Debug: Step Out')
nmap('<Leader>db', function() dap.toggle_breakpoint() end, 'Debug: Toggle Breakpoint')
vim.keymap.set('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input 'Debug: Breakpoint condition: ')
end, { desc = 'Conditional Breakpoint' })

nmap('<Leader>dr', function() dap.repl.open() end, 'Debug: Open Repl')
nmap('<Leader>dl', function() dap.run_last() end, 'Debug: Run Last')
nmap('<Leader>dx', function()
  dap.close()
  dapui.close()
end, 'Debug: Close')
-- stylua: ignore end
-- [[Dev Docs]]
nmap('<Leader>lC', '<cmd>DevdocsOpenFloat<CR>', 'Devdocs: Open Devdocs')
nmap('<Leader>lc', '<cmd>DevdocsOpenCurrentFloat<CR>', 'Devdocs: Open Devdocs Current')
-- stylua: ignore start
-- [[Refactor]]
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end, { desc = 'Extract Function' })
vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end, { desc = 'Extract Function To File' })
-- Extract variable supports only visual mode
vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end, { desc = 'Extract Variable' })
-- Inline func supports only normal
vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end, { desc = 'Inline Function' })
-- Inline var supports both normal and visual mode
vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end, { desc = 'Inline Variable' })
-- Extract block supports only normal mode
vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end, { desc = 'Extract Block' })
vim.keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end, { desc = 'Extract Block To File' })
-- prompt for a refactor to apply when the remap is triggered
vim.keymap.set(
    {"n", "x"},
    "<leader>rr",
    function() require('refactoring').select_refactor() end, { desc = 'Select Refactor' }
)
-- Note that not all refactor support both normal and visual mode
-- stylua: ignore end

-- vim.keymap.set('n', '<leader>zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
-- vim.keymap.set('n', '<leader>zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
-- vim.keymap.set('n', '<leader>zr', require('ufo').openFoldsExceptKinds, { desc = 'Open all folds except kinds' })
-- vim.keymap.set('n', '<leader>zm', require('ufo').closeFoldsWith, { desc = 'Close all folds with' })
-- vim.keymap.set('n', '<leader>K', function()
--   local winid = require('ufo').peekFoldedLinesUnderCursor()
--   if not winid then
--     -- choose one of coc.nvim and nvim lsp
--     -- vim.fn.CocActionAsync('definitionHover') -- coc.nvim
--     vim.lsp.buf.hover()
--   end
-- end, { desc = 'Peek under cursor' })

-- local widgets = require 'dap.ui.widgets'
-- nmap('<Leader>de', function() widgets.centered_float(widgets.scopes).open() end, 'Open Scopes')
-- nmap('<Leader>dv', function() widgets.centered_float(widgets.variables).open() end, 'Open Variables')
-- nmap('<Leader>df', function() widgets.centered_float(widgets.frames).open() end, 'Open Frames')
-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--   require('dap.ui.widgets').hover()
-- end, { desc = 'Hover' })
-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end, { desc = 'Preview' })
