--
-- Also see .config/nvim/lua/plugins/cmp.lua as there is some luasnip
-- configs there too
--
return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require('luasnip')

    ls.config.set_config {
      history = true,
      updateevents = 'TextChanged,TextChangedI',
      enable_autosnippets = true,
    }

    --
    -- I actually use digraphs quite often so instead of <C-k> as suggested
    -- in the docs I'll go with <C-j> to insert a snippet or jump forward
    -- to the next node.
    --
    vim.keymap.set({ 'i', 's' }, '<C-j>', function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    ----
    --
    -- <S-Tab> to jump back on snippet nodes.
    --
    vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    vim.keymap.set('i', '<c-l>', function()
      if ls.choice_active() then
        ls.change_choice()
      end
    end, { silent = true })

    require('luasnip.loaders.from_lua').load({
      paths = {
        '~/.config/nvim/snips/'
      }
    })
  end
}
