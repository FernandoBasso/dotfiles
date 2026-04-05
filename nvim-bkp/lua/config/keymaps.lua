----
-- Save with Ctrl+s. See `:help update`.
--
vim.keymap.set('n', '<C-;>', ':update<CR>')
vim.keymap.set('i', '<C-;>', '<Esc>:update<CR>')

------------------------------------------------------------------------
-- Quickfix ------------------------------------------------------------
------------------------------------------------------------------------

----
-- Close the quickfix window.
--
vim.keymap.set(
  'n',
  '<Leader>qo',
  function()
    vim.cmd('copen')
  end,
  { desc = '[Q]uickfix [O]pen' }
)

----
-- Close the quickfix window.
--
vim.keymap.set(
  'n',
  '<Leader>qc',
  function()
    vim.cmd('cclose')
  end,
  { desc = '[Q]uickfix [C]lose' }
)

----
-- Next quickfix item
--
vim.keymap.set(
  'n',
  '<Leader>qn',
  function()
    vim.cmd('cnext')
  end,
  { desc = '[Q]uickfix [N]ext item' }
)

----
-- Previous quickfix item
--
vim.keymap.set(
  'n',
  '<Leader>qp',
  function()
    vim.cmd('cprevious')
  end,
  { desc = '[Q]uickfix [P]revious item' }
)
