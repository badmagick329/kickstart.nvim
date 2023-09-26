-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Undo dir
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- Make line numbers default
vim.wo.number = true
-- Hybrid line numbers
vim.o.nu = true
vim.o.rnu = true

-- Use spaces instead of tab
vim.o.expandtab = true
-- Set tab length to 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
-- better scrolling
vim.o.scrolloff = 8

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 150
vim.o.timeoutlen = 1000

-- Color column
vim.o.colorcolumn = "80"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- repl settings
vim.g.repl_filetype_commands = {
  python = "ipython --no-autoindent",
  -- python = "ptpython --dark-bg",
  javascript = "node",
}
vim.g.repl_split = 'right'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

