--
-- LuaSnip snippets for AsciiDoc[tor]
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

-- local hrini = [=[
-- = {} :: HackerRank {} Challenge
-- :page-subtitle: HackerRank
-- :page-tags: hackerrank algorithm
--
-- * [{} :: HackerRank {} Challenge]({})
-- ]=]

local cwini = [=[
= {}
:page-subtitle: {}kyu Codewars Challenge
:page-tags: codewars algorithm

* link:{}[{} :: Codewars {}kyu Challenge^]
]=]

local adoc_snips = {
  s(
    'cwini',
    fmt(cwini, { i(1), i(2), i(3), rep(1), rep(2) })
  ),
}

ls.add_snippets('asciidoctor', adoc_snips, { key = 'adoc' })
