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


local ruby_snips = {
  -----
  -- RSpec.describe block
  --
  s(
    'desc',
    fmt(
      [[
        RSpec.describe '{}' do
          {}
        end
      ]], {
        i(1), i(2)
      }
    )
  ),

  -----
  -- RSpec it block
  --
  s(
    'it',
    fmt(
      [[
        it '{}' do
          {}
        end
      ]], {
        i(1), i(2)
      }
    )
  ),

  ----
  -- Pretty print with ====
  --
  s(
    'pp',
    fmt(
      [[
        puts '========================================'
        pp {}
        puts '========================================'
      ]], {
        i(1)
      }
    )
  ),
}

ls.add_snippets('ruby', ruby_snips, { key = 'rb' })
