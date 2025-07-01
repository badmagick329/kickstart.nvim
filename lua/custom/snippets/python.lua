local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('python', {
  s('deff', {
    t 'def ',
    i(1, 'name'),
    t '(',
    i(2, 'args'),
    t { '):', '\t' },
    i(0),
  }),
})
