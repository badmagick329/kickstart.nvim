-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  -- [[ Configure Telescope ]]
  -- See `:help telescope` and `:help telescope.setup()`
  config = function()
    local t = require 'telescope'
    t.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
        file_ignore_patterns = {
          'node_modules/*',
          '.git/*',
          'venv/*',
          'vnv/*',
          '__pycache__/*',
          '.pytest_cache/*',
          'go.sum',
          '**/*.jpg',
          '**/*.png',
          '**/*.mp4',
          '**/*.webm',
          '**/*.mkv',
          '**/*.avi',
          '**/package-lock.json',
          '**/yarn.lock',
          '**/package.json',
          '.next',
          '.cache',
          '.DS_Store',
          'fontawesomefree/*',
        },
      },
    }
    -- Enable telescope fzf native, if installed
    pcall(t.load_extension, 'fzf')
  end,
}
