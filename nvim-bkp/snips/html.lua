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
local l = require('luasnip.extras').lambda

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

  --
  -- Anki Card
  --
  -- Will create something like this:
  --
  --
  --    <!-- INI ANKI FRONT -->
  --    <div class="anki front">
  --      (cursor here)
  --    </div>
  --    <!-- END ANKI FRONT -->
  --
  s(
    'anki',
    fmt(
      [[
        <!-- INI ANKI {card_type} -->
        <div class="anki {}">
          {}
        </div>
        <!-- END ANKI {card_type} -->
      ]], {
        i(1),
        i(2),
        card_type = l(l._1:upper(), 1)
      }
    )
  ),

  --
  -- Anki HTML code block.
  --
  --      <div class="anki-code-block">
  --        <pre>(cursor here)
  --<code>
  --</code></pre>
  --      </div>
  --
  -- The cursor starts immediately after <code>$ so we don't
  -- get an extraneous line break at the beginning of each
  -- piece of code samples which would mess the presentation
  -- depending on how it is rendered on different browsers,
  -- tools and services.
  --
  -- Also the </pre> following </code> have to be on the same
  -- line for similar reasons.
  --
  -- In short, the last line of actual code has to be on
  -- the same line as the closing </code></pre>. Here's
  -- a full example on how it has to look:
  --
  --          <div class="anki-code-block">
  --     <pre><code>#include &lt;stdio.h&gt;
  --
  --     int main(void) {
  --       fprintf(stdout, "%s\n", "Hello, World!");
  --
  --       return 0;
  --     }</code></pre>
  --          </div>
  --
  -- And of course, don't forget to use proper HTML entities
  -- for special stuff like <, >, or &, among others.
  --
  s(
    'ahcb',
    fmt(
      [[
        <div class="anki-code-block">
  <pre><code>{}</code></pre>
        </div>
      ]], {
        i(1),
      }
    )
  ),
}

ls.add_snippets('html', html_snips, { key = 'html' })
