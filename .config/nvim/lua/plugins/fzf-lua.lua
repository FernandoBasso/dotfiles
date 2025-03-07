return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    local fzflua = require('fzf-lua')
    fzflua.setup({
      winopts = {
        height = 0.96,
        width = 0.94,
        backdrop = 95,
      },
    })

    ----
    -- Trigger :Telescope.
    --
    vim.cmd [[nnoremap <Leader>F :FzfLua <C-d>]]
    vim.cmd [[nnoremap <Leader>fl :FzfLua lsp_<C-d>]]

    vim.keymap.set(
      'n',
      '<leader>sf',
      function() fzflua.files() end,
      { desc = '[S]earch [F]iles' }
    )

    vim.keymap.set(
      'n',
      '<leader>gr',
      function() fzflua.lsp_references() end,
      { desc = '[G]o to [R]eferences' }
    )

    vim.keymap.set(
      'n',
      '<leader>gi',
      function() fzflua.lsp_implementations() end,
      { desc = '[G]o to [I]mplementations' }
    )

    vim.keymap.set(
      'n',
      '<leader>ds',
      function() fzflua.lsp_document_symbols() end,
      { desc = '[D]ocument [S]ymbols' }
    )

    vim.keymap.set(
      'n',
      '<leader>ws',
      function() fzflua.lsp_live_workspace_symbols() end,
      { desc = 'Live [W]orkspace [S]ymbols' }
    )
  end
}
