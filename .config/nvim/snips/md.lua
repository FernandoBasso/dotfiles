--
-- LuaSnip snippets for Markdown
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



local hrini = [=[
---
title: {} :: HackerRank {} Challenge
description: Solutions with notes and explanations for the {} HackerRank Challenge in a few different programming languages
---

# {}

- [{} :: HackerRank {} Challenge]({})
]=]


local md_snips = {
  s(
    'hrini',
    fmt(hrini, { i(1), i(2), rep(1), rep(1), rep(1), rep(2), i(3) })
  ),
}

ls.add_snippets('markdown', md_snips, { key = 'md' })
