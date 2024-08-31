vim.g.mapleader = " "

-- Basic Neovim options
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Show search results as you type
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation
vim.opt.tabstop = 4 -- Number of spaces per tab
vim.opt.smartindent = true -- Auto-indent new lines
vim.opt.wrap = false -- Disable line wrapping
vim.opt.swapfile = false -- Disable swapfile
vim.opt.backup = false -- Disable backup file
vim.opt.mouse = ''


-- Primes opts
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- Buffer Management Keybindings
vim.keymap.set('n', '<leader>l', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>h', ':bprevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>bl', ':ls<CR>', { desc = 'List Buffers' })
