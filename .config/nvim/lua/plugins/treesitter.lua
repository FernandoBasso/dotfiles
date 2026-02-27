return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.install({
      "lua",
      "vim",
      "vimdoc",
      "query",
      "bash",
      "gitcommit",
      "git_config",
      "gitignore",
      "gitattributes",
      "haskell",
      "ruby",
      "go",
      "gomod",
      "gosum",
      "gotmpl",
      "javascript",
      "typescript",
      "jsdoc",
      "json",
      "json5",
      "jsx",
      "tsx",
      "c",
      "cpp"
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "bash",
        "gitcommit",
        "git_config",
        "gitignore",
        "gitattributes",
        "haskell",
        "ruby",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "jsx",
        "tsx",
        "jsdoc",
        "json",
        "json5",
        "c",
        "cpp"
      },

      callback = function()
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
        vim.treesitter.start()
      end,
    })
  end
}
