--
-- LuaSnip snippets that apply to all filetypes.
--

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

ls.add_snippets('all', {
  -----
  -- Date like ‘DATETIME: 2023-07-19 20:11’.
  --
  s(
    'dt',
    f(function()
      return os.date "DATETIME: %Y-%m-%d %H:%M"
    end)
  ),

  -----
  -- Single curly quotes: ‘...’
  --
  s('sq', fmt('‘{}’', { i(1) })),

  -----
  -- Double curly quotes: “...”
  --
  s('dq', fmt('“{}”', { i(1) })),

  -----
  -- Backticks: `...`
  --
  s('bt', fmt('`{}`', { i(1) })),

  -----
  -- Markdown Fenced Code Block
  --
  --    ```lang
  --    ... code goes here ...
  --    ```
  --
  s('fcb', fmt('```{}\n{}\n```', { i(1), i(2) })),

  -----
  -- Asciidoc Code Block
  --
  --    [source,lang,extra-attrs]
  --    ----
  --    ... code goes here ...
  --    ----
  --
  s('blk', fmt('[source,{}]\n----\n{}\n----', { i(1), i(2) }))
}, {
  key = 'all'
})


