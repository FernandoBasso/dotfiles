return {
  'tpope/vim-fugitive',
  config = function()
    -- Vim Fugitive Goodies
    --
    -- When I have nvim-tree and symbols outline open on both sides of
    -- the main editing window, I want to first close them before
    -- opening vim fugitive Git window on a vertical split.
    --
    -- Vertical because I like having git info on the left, and I can
    -- then open buffers under inspections on the split on the right so
    -- I can see the changes in more context when needed.
    --
    local vert_git = function()
      vim.api.nvim_command('NvimTreeClose')
      -- vim.api.nvim_command('SymbolsOutlineClose')
      vim.api.nvim_command('vertical Git')
    end

    vim.keymap.set('n', '<Leader>gg', vert_git)
  end
}
