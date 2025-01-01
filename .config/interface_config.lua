
-- lsp_config.lua
local M = {}

-- Function to setup LSP servers
M.setup_interface = function()
    -- Setup color scheme
    vim.cmd[[colorscheme dracula]]

    vim.o.termguicolors = true  -- Enable true color support
    vim.o.cursorline = true    -- Highlight the current line
    vim.o.cursorcolumn = true  -- Highlight the current column
    vim.o.background = "dark"  -- Set a dark background for better contrast

    -- Setup Other
    vim.o.mouse = 'a'           -- Enable mouse in all modes
    vim.o.showmatch = true      -- Highlight matching parentheses and brackets
    vim.o.matchtime = 2         -- Time in tenths of a second to highlight the match

    vim.o.scrolloff = 8        -- Keep 8 lines above/below the cursor
    vim.o.sidescrolloff = 8     -- Keep 8 characters on either side of the cursor

    vim.o.incsearch = true -- Highlight search matches as you type
    vim.o.hlsearch = true -- Keep highlighting search result
    vim.o.wrapscan = true -- Enable wrap scan (search wraps to the beginning/end of the file)

    vim.o.sidescroll = 1 -- Enable minimal horizontal scrolling
    vim.o.sidescrolloff = 5 -- Keep 5 characters visible on the left and right when scrolling horizontally
end

-- Initialize the module
M.init = function()
  M.setup_interface()
end

return M
