-- lsp_config.lua
local M = {}

-- Function to setup LSP servers
M.setup_lsp = function()
  local lspconfig = require('lspconfig')
  local python_path = vim.fn.executable('./bin/python') == 1 and './bin/python' or '/usr/bin/python'

  -- Setup Pyright for Python
  lspconfig.pyright.setup({
    settings = {
      python = {
        pythonPath = python_path,
        linting = {
          enabled = true,
          flake8Enabled = true,  -- Enable flake8
          flake8Args = { "--max-line-length=88" }  -- Optional args for flake8
        },
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- LSP keybindings for navigation
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)       -- Go to definition
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)     -- Go to declaration
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)      -- Show references
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)  -- Go to implementation
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)            -- Hover for docs
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)  -- Rename symbol
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
    end,
  })
end

-- Function to setup Telescope with LSP features
M.setup_telescope = function()
  local telescope = require('telescope.builtin')

  -- Telescope keybindings for LSP features
  vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions, { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gr', telescope.lsp_references, { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gi', telescope.lsp_implementations, { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>gt', telescope.lsp_type_definitions, { noremap = true, silent = true })
end

-- Initialize the module
M.init = function()
  M.setup_lsp()
  M.setup_telescope()
end

return M
