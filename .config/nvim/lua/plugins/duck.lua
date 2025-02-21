return {
  'tamton-aquib/duck.nvim',
  config = function()
    vim.keymap.set(
      'n',
      '<leader>Dd',
      function() require("duck").hatch('🐈') end,
      { desc = 'Duck: hatch' }
    )

    vim.keymap.set(
      'n',
      '<leader>Dk',
      function() require("duck").cook() end,
      { desc = 'Duck: cook' }
    )

    vim.keymap.set(
      'n',
      '<leader>Da',
      function() require("duck").cook_all() end,
      { desc = 'Duck: cook all' }
    )
  end
}
