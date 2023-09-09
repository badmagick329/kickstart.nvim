return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    -- -- Ignore example
    -- local api = require 'typescript-tools.api'
    -- require('typescript-tools').setup {
    --   handlers = {
    --     ['textDocument/publishDiagnostics'] = api
    --       .filter_diagnostics -- Ignore 'This may be converted to an async function' diagnostics. { 80006 },
    --   },
    -- }
    require('typescript-tools').setup {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeCompletionsForModuleExports = true,
          quotePreference = 'auto',
        },
        tsserver_format_options = {
          allowIncompleteCompletions = false,
          allowRenameOfImportPath = false,
        },
      },
    }
  end,
}
