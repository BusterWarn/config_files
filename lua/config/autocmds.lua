-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_command('command! FilePath :echo expand("%:p")')
vim.api.nvim_command('command! FilePathCp let @+=expand("%:p")')

-- From "nvim-lua/kickstart.nvim"

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require("telescope.builtin").live_grep({
      search_dirs = { git_root },
    })
  end
end
vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

-- Create an augroup for our autocmds
local log_syntax_group = vim.api.nvim_create_augroup("LogSyntax", { clear = true })

-- Function to check if a file is a log file
local function is_log_file(bufnr)
  bufnr = bufnr or 0
  local file_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
  local extension = vim.fn.fnamemodify(file_name, ":e")
  return extension == "log" or file_name:match("_log$")
end

-- Function to set filetype to log
local function set_log_filetype(bufnr)
  bufnr = bufnr or 0
  if is_log_file(bufnr) and vim.bo[bufnr].filetype ~= "log" then
    vim.bo[bufnr].filetype = "log"
    print("Filetype set to log for buffer: " .. vim.api.nvim_buf_get_name(bufnr))
    vim.cmd("source ~/.config/nvim/vim/.vim/syntax/log.vim")
  end
end

-- Create autocmds for .log and *_log files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufEnter" }, {
  group = log_syntax_group,
  pattern = { "*.log", "*_log" },
  callback = function(ev)
    vim.schedule(function()
      set_log_filetype(ev.buf)
    end)
  end
})

-- Fallback autocmd to catch any missed log files
vim.api.nvim_create_autocmd("FileType", {
  group = log_syntax_group,
  pattern = "*",
  callback = function(ev)
    if is_log_file(ev.buf) and vim.bo[ev.buf].filetype ~= "log" then
      print("Correcting filetype for log file: " .. vim.api.nvim_buf_get_name(ev.buf))
      set_log_filetype(ev.buf)
    end
  end
})
