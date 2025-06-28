return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot', -- load on Copilot commands
  event = 'InsertEnter', -- or only on first InsertEnter
  config = function()
    require('copilot').setup { -- fine-tune below
      suggestion = {
        enabled = true, -- turn on inline suggestions
        auto_trigger = false, -- require manual trigger
        debounce = 75, -- delay before showing suggestions
        keymap = {
          accept = '<C-l>', -- accept with Ctrl-l
          next = '<C-n>', -- cycle suggestions
          prev = '<C-p>',
        },
      },
      panel = { enabled = false }, -- disable separate panel
    }
  end,
}
