-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Delete default lazyvim keysmaps that I don't like.

-- vim.keymap.del("n", "<leader>ff")
-- vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader><space>")

-- Steal keybindings from "nvim-lua/kickstart.nvim"
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })

-- document existing key chains
-- require("which-key").register({
--   ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
--   ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
--   ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
--   ["<leader>h"] = { name = "More git", _ = "which_key_ignore" },
--   ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
--   ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
--   ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
-- })

function ToggleLogSyntax()
  -- Get the current syntax
  local current_syntax = vim.api.nvim_buf_get_option(0, 'syntax')

  if current_syntax ~= 'log' then
    -- Store the current syntax and set to 'log'
    previous_syntax = current_syntax
    vim.api.nvim_buf_set_option(0, 'syntax', 'log')
    vim.cmd("source ~/.config/nvim/vim/.vim/syntax/log.vim")
  else
    -- Restore the previous syntax
    vim.api.nvim_buf_set_option(0, 'syntax', previous_syntax or '')
  end
end

vim.keymap.set("n", "<F4>", ":lua ToggleLogSyntax()<CR>", { desc = "Toggle Log Syntax Highlighting" })
