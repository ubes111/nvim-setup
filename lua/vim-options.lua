-- Disable arrow keys in all modes
for _, mode in pairs({ 'n', 'i', 'v', 'x' }) do
    for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
        vim.keymap.set(mode, key, '<nop>', { noremap = true, silent = true })
    end
end

-- Set leader key
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
vim.opt.mouse = '' -- Disable mouse support

-- Prime's visual mode movement options
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Buffer Management Keybindings
vim.keymap.set('n', '<leader>l', ':bnext<CR>', { noremap = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>h', ':bprevious<CR>', { noremap = true, desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>bl', ':ls<CR>', { noremap = true, desc = 'List Buffers' })
