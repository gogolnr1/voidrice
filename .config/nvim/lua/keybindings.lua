local M = {}

M.setup = function()
    -- Set leader key
    vim.g.mapleader = ","

    -- Helper function for setting keymaps
    local map = vim.keymap.set
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

    -- Smooth cursor control
    map('n', 'j', 'gj', opts)  -- Move cursor down by line (wrap lines properly)
    map('n', 'k', 'gk', opts)  -- Move cursor up by line (wrap lines properly)

    -- Line movement using Ctrl
    map('n', '<C-j>', 'j', opts)  -- Use Ctrl+j to move down
    map('n', '<C-k>', 'k', opts)  -- Use Ctrl+k to move up

    -- FZF file search
    map('n', '<leader>ff', ':Files<CR>', opts)

    -- Clear search highlights
    map('n', '<leader>nh', ':nohlsearch<CR>', opts)

    -- Telescope keybindings
    local telescope = require('telescope.builtin')
    map('n', '<leader>fg', function() telescope.live_grep() end, opts)
    map('n', '<leader>fb', function() telescope.buffers() end, opts)
    map('n', '<leader>fs', function() telescope.current_buffer_fuzzy_find() end, opts)
    map('n', '<leader>fh', function() telescope.help_tags() end, opts)
    map('n', '<leader>fc', function() telescope.commands() end, opts)
    map('n', '<leader>fk', function() telescope.keymaps() end, opts)
    map('n', '<leader>ft', function() telescope.tags() end, opts)
    map('n', '<leader>fn', function() 
        telescope.find_files({ search_dirs = { vim.fn.expand('~/.config/nvim') } })
    end, opts)
end

return M
