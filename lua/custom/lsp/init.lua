-- [[ Configure LSP ]]
-- Native type hints
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.inlayHintProvider then
      if vim.lsp.inlay_hint ~= nil then
        vim.lsp.inlay_hint(args.buf, true)
      end
    end
    -- whatever other lsp config you want
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    nmap('<leader>lr', vim.lsp.buf.rename, '[R]ename')
    nmap('<leader>la', vim.lsp.buf.code_action, 'Code [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>lD', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document [S]ymbols')
    nmap('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    nmap('<leader>ld', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>', 'Open line [d]iagnostics in float')
    nmap('<leader>lo', '<cmd>SymbolsOutline<cr>', 'Symbols Outline')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>lwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
  end,
})

--  This function gets run when an LSP connects to a particular buffer.
local util = require 'lspconfig.util'
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  nmap('<leader>lr', vim.lsp.buf.rename, '[R]ename')
  nmap('<leader>la', vim.lsp.buf.code_action, 'Code [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>lD', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document [S]ymbols')
  nmap('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>ld', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>', 'Open line [d]iagnostics in float')
  nmap('<leader>lo', '<cmd>SymbolsOutline<cr>', 'Symbols Outline')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  -- Using formatter.nvim instead
  -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
  --   vim.lsp.buf.format()
  -- end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  clangd = {},
  svelte = {},
  tailwindcss = {
    filetypes = {
      'html',
    },
  },
  -- pyright = {
  --   settings = {
  --     python = {
  --       analysis = {
  --         autoSearchPaths = true,
  --         autoImportCompletions = true,
  --         completeFunctionParens = true,
  --         diagnosticMode = 'workspace',
  --         useLibraryCodeForTypes = true,
  --         -- useLibraryCodeForTypes = false,
  --         diagnosticSeverityOverrides = {
  --           reportGeneralTypeIssues = 'none',
  --           reportOptionalSubscript = 'none',
  --           reportPrivateUsage = 'warning',
  --           reportOptionalMemberAccess = 'none',
  --         },
  --       },
  --     },
  --   },
  -- },
  emmet_ls = {},
  html = {
    filetypes = { 'html', 'twig', 'hbs', 'htmldjango' },
    settings = {
      html = {
        format = {
          templating = true,
          wrapLineLength = 80,
          wrapAttributes = 'auto',
        },
        hover = {
          documentation = true,
          references = true,
        },
      },
    },
  },
  jsonls = {
    settings = {
      json = {
        -- schemas = require('schemastore').json.schemas {
        -- To use a subset of the catalog:
        -- select = {
        --   '.eslintrc',
        --   'package.json',
        -- },
        -- To ignore a subset
        -- ignore = {
        --   '.eslintrc',
        --   'package.json',
        -- },
        -- },
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
      yaml = {
        schemaStore = {
          -- You must disable built-in schemaStore support if you want to use
          -- this plugin and its advanced options like `ignore`.
          enable = false,
          -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
          url = '',
        },
        schemas = require('schemastore').yaml.schemas(),
      },
    },
  },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- General lsp config

local config = {
  underline = false,
}
vim.diagnostic.config(config)

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      -- on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

local lspconfig = require 'lspconfig'

-- pyright setup
lspconfig.pyright.setup {
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        autoImportCompletions = true,
        completeFunctionParens = true,
        diagnosticMode = 'workspace',
        useLibraryCodeForTypes = true,
        -- useLibraryCodeForTypes = false,
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = 'information',
          reportOptionalSubscript = 'none',
          reportPrivateUsage = 'warning',
          reportOptionalMemberAccess = 'none',
        },
      },
    },
  },
  filetypes = { 'python' },
}

-- Settings with inlay hints
-- typescript-tools
local ih = require 'inlay-hints'
lspconfig['typescript-tools'].setup {
  capabilities = capabilities,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_dir = function(fname)
    return util.root_pattern 'tsconfig.json'(fname) or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
  end,
  single_file_support = true,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
}
-- gopls
lspconfig.gopls.setup {
  on_attach = function(c, b)
    ih.on_attach(c, b)
  end,
  capabilities = capabilities,
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
