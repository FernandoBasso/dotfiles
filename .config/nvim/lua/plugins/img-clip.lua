return {
  'HakonHarnes/img-clip.nvim',
  event = 'VeryLazy',
  opts = {
    relative_to_current_file = true,
    filetypes = {
      markdown = {
        ----
        -- Assume the image will always be placed on directory above
        -- as I'm mostly using this to write content on my own website.
        --
        dir_path = function()
          return vim.fn.expand('%:.:h') .. '/../__assets'
        end,

        url_encode_path = true,
        template = '![$CURSOR]($FILE_PATH)',
        download_images = false,
      },
      asciidoctor = {
        ----
        -- Make the image directory location relative to the location of
        -- the current buffer. For example, if we have:
        --
        --   ~/source/myproj/docs/cmdline/sed-intro.adoc
        --
        -- The, the image is place under:
        --
        --   ~/source/myproj/docs/cmdline/__assets/<image-name>.png
        --
        -- For AsciiDoc[tor], I like to always keep the images under an
        -- `__assets/` directory relative to the current file.
        --
        dir_path = function()
          return vim.fn.expand('%:.:h') .. '/__assets'
        end,

        url_encode_path = true, ---@type boolean | fun(): boolean

        ----
        -- • https://docs.asciidoctor.org/asciidoc/latest/macros/images/
        --
        template = "image::$FILE_PATH[$CURSOR]", ---@type string | fun(context: table): string

        download_images = false, ---@type boolean | fun(): boolean
      },
    },
  },
  keys = {
    {
      '<leader><leader>pi',
      '<cmd>PasteImage<cr>',
      desc = 'Paste image from system clipboard',
    },
  },
}
