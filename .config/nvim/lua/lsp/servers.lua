local lspconfig = require('lspconfig')

-- Helper function for on_attach
local on_attach = function(_, bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }

    buf_map(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_map(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_map(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

-- Python: Pyright
lspconfig.pyright.setup({
    on_attach = on_attach,
})
