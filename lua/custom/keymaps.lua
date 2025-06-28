local opts = { noremap = true, silent = true }
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)
-- Save
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts)
-- Save without formatting
vim.keymap.set('n', '<Leader>lS', '<cmd>noautocmd w<CR>', opts)

-- Don't copy to register
vim.keymap.set({ 'n', 'x' }, 'x', '"_x', opts)
vim.keymap.set({ 'n' }, 's', '"_s', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', 'L', ':bnext<CR>', opts)
vim.keymap.set('n', 'H', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
-- vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
-- vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
-- vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
-- vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
-- vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Diagnostic keymaps
local diagnostic_jump_prev = function()
  vim.diagnostic.jump { count = -1, float = true }
end
local diagnostic_jump_next = function()
  vim.diagnostic.jump { count = 1, float = true }
end

vim.keymap.set('n', '[q', diagnostic_jump_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']q', diagnostic_jump_next, { desc = 'Go to next [D]iagnostic message' })
-- Quickfix list
vim.keymap.set('n', '<leader>qq', vim.diagnostic.setloclist, { desc = 'Open [Q]uickfix list' })
vim.keymap.set('n', '<leader>qn', '<cmd>cn<cr>', { desc = '[N]ext Fix' })
vim.keymap.set('n', '<leader>qN', '<cmd>cla<cr>', { desc = 'Last Fix' })
vim.keymap.set('n', '<leader>qp', '<cmd>cp<cr>', { desc = '[P]revious Fix' })
vim.keymap.set('n', '<leader>qP', '<cmd>cfir<cr>', { desc = 'First Fix' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- keep track of current diagnostics state
local inline_diags_enabled = true

-- toggle function
local function toggle_inline_diagnostics()
  inline_diags_enabled = not inline_diags_enabled
  vim.diagnostic.config {
    virtual_text = inline_diags_enabled,
    -- you can also keep your other diagnostic opts here:
    signs = true,
    underline = true,
    update_in_insert = false,
  }
  print('Inline diagnostics ' .. (inline_diags_enabled and 'enabled' or 'disabled'))
end

-- keymap: <Leader>qd to toggle inline diagnostics
vim.keymap.set('n', '<Leader>qd', toggle_inline_diagnostics, { desc = 'Toggle inline diagnostics' })
