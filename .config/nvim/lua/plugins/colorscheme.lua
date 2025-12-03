return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  lazy = false,

  config = function()
    require('gruvbox').setup({
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true,
      contrast = '',
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    })

    vim.cmd('set background=dark')
    vim.cmd('colorscheme gruvbox')
  end
}
