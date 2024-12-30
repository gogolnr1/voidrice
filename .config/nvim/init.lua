require('settings')
require('plugins')
require('keybindings')
require('lsp')
require('completion')
require('dap_init')

require('bufferline_config').setup()
require('session_config').setup()
require('codet5_config').setup()

-- Setup black formatter
vim.g.neoformat_python_black = {
  exe = "black",
  args = {"--line-length", "88"},
  stdin = 1,
}
