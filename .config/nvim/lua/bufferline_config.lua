local M = {}

M.setup = function()
  require('bufferline').setup {
    options = {
      numbers = "none",
      close_command = "bdelete %d",
      right_mouse_command = "bdelete %d",
      left_mouse_command = "buffer %d",
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin",
    },
  }

  -- Browser-like buffer navigation
  vim.keymap.set('n', '<C-PageUp>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-PageDown>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-w>', ':bdelete<CR>', { noremap = true, silent = true })
end

return M