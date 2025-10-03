return {
  cmd = { "clojure-lsp" },
  filetypes = { "clojure", "edn" },
  root_markers = {
    "project.clj",
    "deps.edn",
    "build.boot",
    "shadow-cljs.edn",
    "bb.edn",
    ".git",
  },
  settings = {
    clojure = {
      format = {
        provider = "cljfmt",
      },
      lint = {
        lintOnChange = true,
        lintOnSave = true,
        lintOnReplLoad = true,
      },
      repl = {
        type = "clj",
        autoStart = true,
      },
      single_file_support = true,
      log_level = vim.lsp.protocol.MessageType.Warning,
    }
  }
}
