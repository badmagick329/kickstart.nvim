return {
  'danymat/neogen',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('neogen').setup {
      enable = true,
      languages = {
        python = {
          template = {
            annotation_convention = 'numpydoc',
          },
        },
        rust = {
          template = {
            annotation_convention = 'rustdoc',
          },
        },
      },
    }
  end,
}
