return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      winopts = {
        width = 0.95,
        height = 0.9,
        row = 0.5,
        col = 0.5,
        preview = {
          scrollchars = { "·", "" },
        },
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    config = function()
      require("luasnip.loaders.from_lua").load({
        paths = { "~/.config/nvim/snips/" },
      })

      require("luasnip").config.setup({
        update_events = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })
    end,
  },
}
