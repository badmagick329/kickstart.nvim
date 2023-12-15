return {
  'mhartington/formatter.nvim',
  config = function()
    local util = require 'formatter.util'
    require('formatter').setup {
      -- Enable or disable logging
      logging = true,
      -- Set the log level
      log_level = vim.log.levels.WARN,
      -- All formatter configurations are opt-in
      filetype = {

        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
          -- "formatter.filetypes.lua" defines default configurations for the
          -- "lua" filetype
          require('formatter.filetypes.lua').stylua,

          -- You can also define your own configuration
          function()
            -- Supports conditional formatting
            if util.get_current_buffer_file_name() == 'special.lua' then
              return nil
            end
            return {
              exe = 'stylua',
              args = {
                '--search-parent-directories',
                '--stdin-filepath',
                util.escape_path(util.get_current_buffer_file_path()),
                '--',
                '-',
              },
              stdin = true,
            }
          end,
        },
        c = {
          require('formatter.filetypes.c').clangformat,
        },
        rust = {
          require('formatter.filetypes.rust').rustfmt,
        },
        sql = {
          function()
            return {
              exe = 'sql-formatter-cli',
              args = {
                '-',
              },
              stdin = true,
            }
          end,
        },
        go = {
          --[[
          golines -m 79 -t 4
          --]]
          function()
            return {
              exe = 'golines',
              -- args = {
              --   '-m',
              --   '79',
              --   '-t',
              --   '4',
              --   '-w',
              --   util.escape_path(util.get_current_buffer_file_path()),
              -- },
              stdin = true,
            }
          end,
        },
        python = {
          function()
            -- Full specification of configurations is down below and in Vim help
            -- files
            return {
              exe = 'black',
              args = {
                '-q',
                '--line-length',
                '79',
                '-',
              },
              stdin = true,
            }
          end,
          function()
            return {
              exe = 'isort',
              args = {
                '-',
              },
              stdin = true,
            }
          end,
        },
        htmldjango = {
          function()
            return {
              exe = 'djlint',
              args = {
                '--indent',
                '2',
                '--quiet',
                '--format-css',
                '--max-line-length',
                '80',
                '--indent-css',
                '5',
                '--max-attribute-length',
                '80',
                '-',
                '--reformat',
              },
              stdin = true,
            }
          end,
        },
        html = {
          function()
            return {
              exe = 'djlint',
              args = {
                '--indent',
                '2',
                '--quiet',
                '--format-css',
                '--max-line-length',
                '80',
                '--indent-css',
                '5',
                '--max-attribute-length',
                '80',
                '-',
                '--reformat',
              },
              stdin = true,
            }
          end,
        },
        javascript = {
          function()
            return {
              exe = 'prettierd',
              args = {
                util.escape_path(util.get_current_buffer_file_path()),
              },
              stdin = true,
            }
          end,
        },
        javascriptreact = {
          function()
            return {
              exe = 'prettierd',
              args = {
                util.escape_path(util.get_current_buffer_file_path()),
              },
              stdin = true,
            }
          end,
        },
        typescript = {
          function()
            return {
              exe = 'prettierd',
              args = {
                util.escape_path(util.get_current_buffer_file_path()),
              },
              stdin = true,
            }
          end,
        },
        typescriptreact = {
          function()
            return {
              exe = 'prettierd',
              args = {
                util.escape_path(util.get_current_buffer_file_path()),
              },
              stdin = true,
            }
          end,
        },
        markdown = {
          function()
            return {
              exe = 'prettierd',
              args = {
                util.escape_path(util.get_current_buffer_file_path()),
              },
              stdin = true,
            }
          end,
        },
        prisma = {
          function()
            return {
              exe = 'npx',
              args = {
                'prisma',
                'format',
                '--schema',
                util.escape_path(util.get_current_buffer_file_path()),
              },
              stdin = false,
            }
          end,
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ['*'] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require('formatter.filetypes.any').remove_trailing_whitespace,
        },
      },
    }
  end,
}
