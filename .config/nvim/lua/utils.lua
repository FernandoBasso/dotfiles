return {
  keymap =  function (mode, keys, action, description)
    vim.keymap.set(
      mode,
      keys,
      action,
      {
        noremap = true,
        silent = true,
        nowait = true,
        desc = description,
      }
    )
  end
}
