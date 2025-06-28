return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    enabled = true,
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
    },
    config = function(_, opts)
      require('ibl').setup(opts)
    end,
  },
}
