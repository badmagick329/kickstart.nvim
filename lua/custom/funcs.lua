-- Set background to transparent
function scuffed_transparent()
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

function hybridlines()
  vim.o.nu = true
  vim.o.rnu = true
end

function indent(n)
  vim.o.tabstop = n
  vim.o.softtabstop = n
  vim.o.shiftwidth = n
end

function cprints()
  local filetype = vim.bo.filetype
  local c = '# '
  local p = 'print'
  if filetype == 'python' then
    c = '# '
    p = 'print'
  end
  vim.cmd([[%s/\(.*\)\(]] .. p .. [[\)\(.*\)/\1]] .. c .. [[\2\3/g]])
end

function uprints()
  local filetype = vim.bo.filetype
  local c = '# '
  local p = 'print'
  if filetype == 'python' then
    c = '# '
    p = 'print'
  end
  vim.cmd([[%s/\(.*\)\(]] .. c .. p .. [[\)\(.*\)/\1]] .. p .. [[\3/g]])
end

function CloseAllExceptCurrent()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, i in ipairs(bufs) do
    if i ~= current_buf then
      vim.api.nvim_buf_delete(i, {})
    end
  end
end
