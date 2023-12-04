-- All things LSP in here

return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "elixir-ls",
    },
  },
}
