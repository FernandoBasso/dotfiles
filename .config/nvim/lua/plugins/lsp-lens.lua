return {
  'VidocqH/lsp-lens.nvim',

  config = function ()
    local SymbolKind = vim.lsp.protocol.SymbolKind

    require'lsp-lens'.setup({
      enable = false,
      include_declaration = false,      -- Reference include declaration
      sections = {
        definition = function(count)
          return "Defs: " .. count
        end,
        references = function(count)
          return "Refs: " .. count
        end,
        implements = function(count)
          return "Impls: " .. count
        end,
        git_authors = function(latest_author, count)
          return " " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
        end,
      },
      ignore_filetype = {
        "prisma",
      },
      -- Target Symbol Kinds to show lens information
      target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
      -- Symbol Kinds that may have target symbol kinds as children
      wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
    })
  end
}
