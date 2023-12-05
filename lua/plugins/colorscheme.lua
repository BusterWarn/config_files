return {
  {
    "folke/tokyonight.nvim",
    opts = {
      -- transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
