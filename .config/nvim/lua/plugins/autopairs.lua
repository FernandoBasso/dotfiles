return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local ap = require("nvim-autopairs")
    ap.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
    })
  end,
}
