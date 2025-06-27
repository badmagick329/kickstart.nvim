return {
  -- base plugins
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

  { import = 'custom.plugins.whichkey' },
  { import = 'custom.plugins.telescope' },
  { import = 'custom.plugins.colorscheme' },
  { import = 'custom.plugins.mini' },
  { import = 'custom.plugins.treesitter' },
  { import = 'custom.plugins.lsp' },
}
-- vim: ts=2 sts=2 sw=2 et
