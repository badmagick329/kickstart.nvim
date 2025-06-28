return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  -- Guess indent
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'scss', 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    opts = {
      css = { rgb_fn = true, hsl = true, tailwind = true },
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'html',
    },
    config = function(_, opts)
      require('colorizer').setup(opts)
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
