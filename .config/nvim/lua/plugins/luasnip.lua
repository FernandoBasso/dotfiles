--
-- Also see .config/nvim/lua/plugins/cmp.lua as there is some luasnip
-- configs there too
--
return {
  'L3MON4D3/LuaSnip',
  config = function()
    require('luasnip.loaders.from_lua').load({
      paths = '~/.config/nvim/snips/'
    })
  end
}
