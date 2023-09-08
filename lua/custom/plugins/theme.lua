
return {
  -- Theme inspired by Atom
  'sainnhe/sonokai',
  priority = 1000,
  config = function()
    -- sonokai transparent
    vim.g.sonokai_transparent_background = "2"
    vim.g.sonokai_diagnostic_virtual_text = "colored"
    vim.cmd.colorscheme 'sonokai'
  end,
}
