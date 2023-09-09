-- Set background to transparent
function scuffed_transparent ()
  local hgroups = {
    'Normal',
    'NormalFloat',
    'FloatBorder',
    'TelescopeNormal',
    'TelescopeBorder',
    'FloatTitle',
    'NormalNC',
    'Pmenu',
    'PmenuKind',
    'PmenuExtra',
    'PmenuSbar',
    'MsgArea',
    'Directory',
  }
  for _, hgroup in pairs(hgroups) do
    vim.api.nvim_set_hl(0, hgroup, { bg = 'none' })
  end
end

function hybridlines ()
  vim.o.nu = true
  vim.o.rnu = true
end
