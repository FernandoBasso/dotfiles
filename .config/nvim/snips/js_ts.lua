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

--
-- For JS, TS, JSX and TSX.
--
local jsts_snips = {
  -----
  -- console.log('==== <desc>', data);
  --
  s(
    'log',
    fmt("console.log('==== {}', {});", { i(1), i(2) })
  ),

  -----
  -- bool ? then : else
  --
  s('ternary', {
    i(1, 'cond'), t(' ? '), i(2, 'then'), t(' : '), i(3, 'else')
  }),

  -----
  -- JSDoc
  --
  --   /**
  --    * Adds two numbers.
  --    *
  --    * @param {number} x
  --    * @param {number} y
  --    * @returns {number}
  --    */
  s('doc', {
    t({'/**', ''}),
    t({' * '}), i(1, 'Function info...'), t({'', ''}),
    t({' *', ''}),
    t({' * @param '}), i(2, '...'), t({'', ''}),
    t({' * @returns '}), i(3, '...'), t({'', ''}),
    t({' */', ''}),
  })
}

ls.add_snippets('javascript', jsts_snips, { key = 'js' })
ls.add_snippets('typescript', jsts_snips, { key = 'ts' })
ls.add_snippets('javascriptreact', jsts_snips, { key = 'jsx' })
ls.add_snippets('typescriptreact', jsts_snips, { key = 'tsx' })
