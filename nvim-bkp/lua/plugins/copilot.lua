return {
  'github/copilot.vim',

  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap(
      "i",
      "<C-y>",
      'copilot#Accept("<CR>")',
      { expr = true, silent = true }
    )

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        vim.g.copilot_enabled = false
      end,
    })
  end,
}
