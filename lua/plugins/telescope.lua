-- change some telescope options and a keymap to browse plugin files
return {
  "nvim-telescope/telescope.nvim",
  -- change some options
  opts = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    -- If ripgrep is not available!
    vimgrep_arguments = {
      --   "ag",
      --   "--nocolor",
      --   "--nogroup",
      --   "--column",
      --   "--line-numbers",
      --   "--smart-case",
    },
  },
}
