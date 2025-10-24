return {
  { "saghen/blink.compat", version = "*", lazy = true },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      -- "rafamadriz/friendly-snippets",
      "PaterJason/cmp-conjure",
      "mikavilpas/blink-ripgrep.nvim",
      "L3MON4D3/LuaSnip",
    },
    opts = {
      keymap = {
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = {},
        ["<S-Tab>"] = {},
        ["<C-f>"] = {},
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },
      cmdline = {
        enabled = false,
        completion = { menu = { auto_show = true } },
        keymap = {
          ["<CR>"] = { "accept_and_enter", "fallback" },
        },
      },
      completion = {
        menu = {
          border = nil,
          scrolloff = 1,
          scrollbar = false,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
              { "source_name" },
            },
          },
        },
        documentation = {
          window = {
            border = nil,
            scrollbar = false,
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
          },
          auto_show = true,
          auto_show_delay_ms = 500,
        },
      },
      appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "mono" },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "conjure", "ripgrep" },
        providers = {
          conjure = { name = "conjure", module = "blink.compat.source", score_offset = -3 },
          ripgrep = { module = "blink-ripgrep", name = "Ripgrep", score_offset = -3 },
        },
      },
    },
    lazy = false,
  },
}
