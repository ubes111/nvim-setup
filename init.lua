-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit...", "WarningMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup('plugins') -- Ensure 'plugins' matches your plugins file name

-- Apply the colorscheme
vim.cmd.colorscheme("catppuccin")

-- Set up Telescope keymap
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Configure Neo-tree keymaps
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right<CR>')
vim.keymap.set('n', '<C-m>', ':Neotree close<CR>')

-- Basic Neovim options
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Show relative line numbers
vim.opt.hlsearch = true         -- Highlight search results
vim.opt.incsearch = true        -- Show search results as you type
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 4          -- Number of spaces for each indentation
vim.opt.tabstop = 4             -- Number of spaces per tab
vim.opt.smartindent = true      -- Auto-indent new lines
vim.opt.wrap = false            -- Disable line wrapping
vim.opt.swapfile = false        -- Disable swapfile
vim.opt.backup = false          -- Disable backup file

