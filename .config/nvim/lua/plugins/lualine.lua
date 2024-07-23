return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
    },
    sections = {
      lualine_c = {
        { 'filename', path = 1 }
      }
    }
  },
  requires = {
    'kyazdani42/nvim-web-devicons'
  },
}
