-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.

require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- GOAT surround plugin
  'tpope/vim-surround',
  -- lets you repeat things like vim surround motions
  'tpope/vim-repeat',
  'ThePrimeagen/harpoon',
  'pappasam/nvim-repl',
  'mbbill/undotree',
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  -- need this for go
  'simrat39/inlay-hints.nvim',
  -- lazygit
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  -- telescope dap
  'nvim-telescope/telescope-dap.nvim',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- schema store for json/yaml
  'b0o/SchemaStore.nvim',
  -- color picker
  'uga-rosa/ccc.nvim',
  -- Better sort
  'sQVe/sort.nvim',
  -- Context
  'nvim-treesitter/nvim-treesitter-context',

  -- Uncomment any of the lines below to enable.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  { import = 'custom.plugins' },
  require 'custom.dap',
}, {
  change_detection = {
    notify = false,
  },
})
