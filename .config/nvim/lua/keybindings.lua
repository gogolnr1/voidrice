-- Set leader key
vim.g.mapleader = ' '

-- General keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Buffer navigation
map('n', '<leader>bn', ':bnext<CR>', opts)
map('n', '<leader>bp', ':bprev<CR>', opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

-- Window management
map('n', '<leader>vs', ':vsplit<CR>', opts)
map('n', '<leader>hs', ':split<CR>', opts)

-- Git
map('n', '<leader>gs', ':G<CR>', opts)
