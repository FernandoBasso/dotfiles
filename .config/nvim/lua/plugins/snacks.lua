return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  keys = {
    {
      "<leader>Ii",
      function()
        print("HOVERING")
        Snacks.image.hover()
      end,
      desc = "Show image in float window",
    },
  },
  opts = {
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    image = {
      enabled = true,
      inline = false,
      float = true,
      max_width = 100,
      max_height = 100,
    },
    indent = { enabled = true },
    input = {
      enabled = true,
      win = {
        relative = "cursor",
      }
    },
    picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    styles = {
      snacks_image = {
        relative = "cursor",
        -- width = 90,
        -- height = 98,
        border = true,
        focusable = false,
        backdrop = false,
      },
    },
  },
}
