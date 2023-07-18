local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

ls.add_snippets('lua', {
  s('req', fmt("local {} require('{}')", { i(1), rep(1) }))
})

ls.add_snippets('javascript', {
  s('ternary', {
    i(1, 'cond'), t(' ? '), i(2, 'then'), t(' : '), i(3, 'else')
  }),

  s('doc', {
    t({'/**', ''}),
    t({' * '}), i(1, 'Function info...'), t({'', ''}),
    t({' *', ''}),
    t({' * @param '}), i(2, '...'), t({'', ''}),
    t({' * @returns '}), i(3, '...'), t({'', ''}),
    t({' */', ''}),
  })
}, { key = 'js' })
