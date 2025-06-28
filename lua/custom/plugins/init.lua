return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  -- Guess indent
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
}
