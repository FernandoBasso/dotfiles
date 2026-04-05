------------------------------------------------------------------------
-- Close all other buffers except the current one ----------------------
------------------------------------------------------------------------
local close_all_buffers_except_current = function()
  local current_buf = vim.fn.bufnr()
  local current_win = vim.fn.win_getid()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })

  for _, buf in ipairs(bufs) do
    if buf.bufnr ~= current_buf then
      vim.cmd("silent! bdelete " .. buf.bufnr)
    end
  end

  vim.fn.win_gotoid(current_win)
end

----
-- ‘bo’ is for ‘only’.
--
vim.keymap.set(
  'n',
  '<Leader>bo',
  close_all_buffers_except_current,
  {
    silent = true,
    desc = 'Close all buffers except the current active one',
  }
)

vim.api.nvim_create_user_command(
  'CloseOtherBuffers',
  close_all_buffers_except_current,
  {
    desc = 'Close all buffers except the current active one',
  }
)
