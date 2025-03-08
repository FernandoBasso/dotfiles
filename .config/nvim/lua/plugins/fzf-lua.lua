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
      '<leader>sr',
      fzflua.resume,
      { desc = '[S]earch [R]esume' }
    )

    vim.keymap.set(
      'n',
      '<leader>sf',
      fzflua.files,
      { desc = '[S]earch [F]iles' }
    )

    vim.keymap.set(
      'n',
      '<leader>gr',
      fzflua.lsp_references,
      { desc = '[G]o to [R]eferences' }
    )

    vim.keymap.set(
      'n',
      '<leader>gi',
      fzflua.lsp_implementations,
      { desc = '[G]o to [I]mplementations' }
    )

    vim.keymap.set(
      'n',
      '<leader>ds',
      fzflua.lsp_document_symbols,
      { desc = '[D]ocument [S]ymbols' }
    )

    vim.keymap.set(
      'n',
      '<leader>ws',
      fzflua.lsp_live_workspace_symbols,
      { desc = 'Live [W]orkspace [S]ymbols' }
    )
  end
}
