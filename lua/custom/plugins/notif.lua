local opts = {
  timeout = 100,
  stages = 'fade_in_slide_out',
  top_down = true,
  render = 'simple',
  fps = 120,
  skip = true,
}
return {
  'rcarriga/nvim-notify',
  event = 'BufReadPre',
  filter = {
    event = 'msg_show',
    any = {
      { find = '%d+L, %d+B' },
      { find = '; after #%d+' },
      { find = '; before #%d+' },
      { find = '%d fewer lines' },
      { find = '%d more lines' },
    },
  },
  opts = opts,
  config = function()
    local notfiy = require 'notify'
    require('notify').setup {
      background_colour = '#000000',
    }
    vim.notify = notfiy
  end,
}
