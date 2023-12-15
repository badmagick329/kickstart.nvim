return {
  'windwp/nvim-ts-autotag',
  config = function()
    local autotag = require 'nvim-treesitter.configs'
    autotag.setup {
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = false,
      },
    }
  end,
}
