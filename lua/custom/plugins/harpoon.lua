return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}
    vim.keymap.set('n', '<leader>ka', function()
      harpoon:list():add()
    end, { desc = '[A]dd to list' })
    vim.keymap.set('n', '<leader>kk', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Quic[k] Menu' })

    vim.keymap.set('n', '<leader>kq', function()
      harpoon:list():select(1)
    end, { desc = 'Go to 1' })
    vim.keymap.set('n', '<leader>kw', function()
      harpoon:list():select(2)
    end, { desc = 'Go to 2' })
    vim.keymap.set('n', '<leader>ke', function()
      harpoon:list():select(3)
    end, { desc = 'Go to 3' })
    vim.keymap.set('n', '<leader>kr', function()
      harpoon:list():select(4)
    end, { desc = 'Go to 4' })

    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end,
}
-- vim: ts=2 sts=2 sw=2 et
