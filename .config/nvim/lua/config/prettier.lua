--
-- TODO: Find way to restore cursor position.
--
local run_prettier_on_current_buffer = function()
  vim.cmd("silent! %!prettier " .. vim.fn.expand('%'))
end

----
-- ‘bo’ is for ‘only’.
--
vim.keymap.set(
  'n',
  '<Leader>bp',
  run_prettier_on_current_buffer,
  {
    silent = true,
    desc = 'Run prettier on current buffer',
  }
)

vim.api.nvim_create_user_command(
  'RunPrettier',
  run_prettier_on_current_buffer,
  {
    desc = 'Run prettier on current buffer',
  }
)
