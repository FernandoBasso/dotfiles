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

local exercismle = [=[
= {}
:page-subtitle: Exercism Learning Exercise :: {}
:page-tags: {}
:icons: font
:sectlinks:
:sectnums!:
:toclevels: 6
:toc: left

* link:{}[{} Exercism {} learning exercise^]
]=]

local adoc_snips = {
  s(
    'cwini',
    fmt(cwini, { i(1), i(2), i(3), rep(1), rep(2) })
  ),

  s(
    'exercismle',
    fmt(exercismle, { i(1), i(2), i(3), i(4), rep(1), rep(2) })
  ),

  s(
    'adocini',
    fmt(
      [[
        = {}
        :page-subtitle: {}
        :page-tags: {}
        :favicon: https://fernandobasso.dev/cmdline.png
        :icons: font
        :sectlinks:
        :sectnums!:
        :toclevels: 6
        :toc: left
        :source-highlighter: highlight.js
        :imagesdir: __assets
        :stem: latexmath
        ifdef::env-github[]
        :tip-caption: :bulb:
        :note-caption: :information_source:
        :important-caption: :heavy_exclamation_mark:
        :caution-caption: :fire:
        :warning-caption: :warning:
        endif::[]
      ]], { i(1), i(2), i(3) }
    )
  )
}

ls.add_snippets('asciidoctor', adoc_snips, { key = 'adoc' })
