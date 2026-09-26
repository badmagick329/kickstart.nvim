local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require 'luasnip.extras'
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt

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

ls.add_snippets('python', {
  s('init', {
    t 'def __init__(self, ',
    i(1, 'args'),
    t { '):', '\t' },
    i(0),
  }),
})
