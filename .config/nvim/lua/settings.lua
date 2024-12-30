-- Basic settings
vim.o.tabstop = 4             -- Tab size
vim.o.shiftwidth = 4          -- Indent size
vim.o.expandtab = true        -- Use spaces instead of tabs
vim.o.smartindent = true      -- Smart indentation
vim.o.termguicolors = true    -- Enable 24-bit RGB color
vim.o.cursorline = true       -- Highlight the current line
vim.o.mouse = 'a'             -- Enable mouse support
vim.o.number = true           -- Show line numbers
vim.o.relativenumber = true   -- Relative line numbers
vim.o.wrap = false            -- Disable line wrapping
vim.o.scrolloff = 8           -- Keep 8 lines of context
vim.o.sidescrolloff = 8       -- Same for horizontal scrolling

-- Search settings
vim.o.ignorecase = true       -- Ignore case in searches
vim.o.smartcase = true        -- Override ignorecase if uppercase is used
vim.o.hlsearch = true         -- Highlight search results
vim.o.incsearch = true        -- Show search results as you type

-- Additional visual settings
vim.o.cursorcolumn = true
vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.wrapscan = true
vim.o.sidescroll = 1

-- Theme
vim.cmd('colorscheme dracula') -- Set the theme to Dracula

-- Auto-reload configuration
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "init.lua",
    command = "source $MYVIMRC",
})

-- File type specific indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python"},
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "html"},
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})
