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

local ini_main_void = [=[
#include <stdio.h>

int main(void) {{
  {}

  return 0;
}}
]=]

local main_void = [=[
int main(void) {{
  {}

  return 0;
}}
]=]

local c_snips = {
  -----
  -- int main(void) with include stdio
  --
  s(
    'imv',
    fmt(ini_main_void, { i(1) })
  ),

  -----
  --- int main(void)
  ---
  s(
    'mv',
    fmt(main_void, { i(1) })
  ),
}

ls.add_snippets('c', c_snips, { key = 'c' })
