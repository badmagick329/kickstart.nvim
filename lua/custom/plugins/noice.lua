return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = {
    -- Disable pylsp linting spam
    routes = {
      {
        filter = {
          event = 'lsp',
          kind = 'progress',
          -- Only skip for pylsp
          cond = function(message)
            -- message.opts.progress.client holds the LSP name
            local client = vim.tbl_get(message.opts, 'progress', 'client')
            return client == 'pylsp'
          end,
        },
        opts = { skip = true },
      },
    },
    -- Disable cmdline replacement
    cmdline = {
      enabled = false,
    },
    -- Disable the custom messages UI
    messages = {
      enabled = false,
    },
    -- Disable routing them through the notify view
    notify = {
      enabled = false,
    },
    -- Only enable the LSP documentation border
    presets = {
      bottom_search = false, -- keep built-in search UI
      command_palette = false, -- disable cmdline popup
      long_message_to_split = false, -- don’t split long messages
      inc_rename = false, -- disable in-rename dialog
      lsp_doc_border = true, -- add a border to hover/signature help
    },
    -- (Optional) further tweak the hover window
    lsp = {
      documentation = {
        -- you can override any default, e.g. add a semi-transparent background
        view = 'hover',
        opts = {
          border = 'rounded',
          winblend = 10,
        },
      },
    },
  },
}
