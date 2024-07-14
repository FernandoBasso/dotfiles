
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

local go_snips = {
  ----
  -- func
  --
  s(
    'fn',
    fmt(
      [[
        func {}() {{
          {}
        }}
      ]], { i(1), i(2) }
    )
  ),

  ----
  -- fmt.Println() (assumes import "fmt" in the module)
  --
  s(
    'pl',
    fmt('fmt.Println({})', { i(1) })
  ),

  ----
  -- for
  --
  s(
    'for',
    fmt(
      [[
        for {} {{
          {}
        }}
      ]], { i(1), i(2) }
    )
  ),

  ----
  -- if
  --
  s(
    'if',
    fmt(
      [[
        if {} {{
          {}
        }}
      ]], { i(1), i(2) }
    )
  ),
}


ls.add_snippets('go', go_snips, { key = 'go' })

