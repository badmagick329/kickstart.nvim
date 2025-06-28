-- autopairs
-- https://github.com/windwp/nvim-autopairs
return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter', -- or 'BufReadPre'
    dependencies = 'nvim-treesitter',
    config = function()
      require('nvim-ts-autotag').setup {
        enable_close = true, -- auto close tags
        enable_rename = true, -- auto rename on <Change>
      }
    end,
  },
}
