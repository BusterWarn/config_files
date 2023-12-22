-- All things LSP in here

return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "elixir-ls",
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "p00f/clangd_extensions.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          require("clangd_extensions.inlay_hints").setup_autocmd()
          require("clangd_extensions.inlay_hints").set_inlay_hints()
        end)
      end,
    },
  },

}
