return {
  'norcalli/nvim-colorizer.lua',
  ft = { 'css', 'scss', 'html', 'htmldjango', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  opts = {
    css = { rgb_fn = true, hsl = true, tailwind = true },
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'html',
    'htmldjango',
  },
  config = function(_, opts)
    require('colorizer').setup(opts)
  end,
}
