return {
  "habamax/vim-asciidoctor",
  config = function()
    vim.g.asciidoctor_folding = 1
    vim.g.asciidoctor_fenced_languages = {
      "c",
      "javascript",
      "typescript",
      "go",
      "ruby",
      "bash",
    }
  end,
}
