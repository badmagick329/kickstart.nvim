return {

  'nvim-pack/nvim-spectre',
  opts = {},
  config = function(_, opts)
    vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").toggle()<CR>', {
      desc = 'Spectre: Toggle S[p]ectre',
    })
    -- vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    --   desc = 'Search current word',
    -- })
    -- vim.keymap.set('v', '<leader>sW', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    --   desc = 'Spectre: Search current [w]ord',
    -- })
    vim.keymap.set('n', '<leader>sx', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
      desc = 'Spectre: Search on current file',
    })
    require('spectre').setup(opts)
  end,
}
