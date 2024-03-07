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
-- HTML Snippets
--
local html_snips = {
  --
  -- HTML5
  --
  s(
    'html',
    fmt(
      [[
        <!DOCTYPE html>
        <html>
        <head>
          <meta charset="UTF-8" />
          <title>{}</title>
        </head>
        <body>
          {}
        </body>
        </html>
      ]], { i(1), i(2) }
    )
  ),
}

ls.add_snippets('html', html_snips, { key = 'html' })

