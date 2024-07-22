return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },

  config = function()
    local bufferline = require('bufferline')

    vim.cmd [[
      nnoremap <silent><Leader>n :BufferLineCycleNext<CR>
      nnoremap <silent><Leader>p :BufferLineCyclePrev<CR>

      nnoremap <silent><Leader>mn :BufferLineMoveNext<CR>
      nnoremap <silent><Leader>mp :BufferLineMovePrev<CR>

      nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
      nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
      nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
      nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
      nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
      nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
      nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
      nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
      nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
      nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>
    ]]

    bufferline.setup {
      options = {
        style_preset = {
          bufferline.style_preset.no_italic,
        },
        mode = "buffers",
        numbers = "ordinal",
        show_buffer_close_icons = false,
        diagnostics = "nvim_lsp",
      }
    }
  end
}
