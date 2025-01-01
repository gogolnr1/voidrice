local M = {}

M.setup = function()
  -- Set up vim-startify session management
  vim.g.startify_session_persistence = 1
  vim.g.startify_session_dir = vim.fn.expand('~/.config/nvim/sessions/')
  vim.g.startify_session_file = 'session.vim'
  vim.g.startify_change_to_dir = 0

  -- Auto-save session on exit
  vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
      vim.cmd('StartifySaveSession')
    end,
  })

  -- Auto-load session if it exists
  if vim.fn.filereadable(vim.fn.expand('~/.config/nvim/sessions/session.vim')) == 1 then
    vim.cmd('source ~/.config/nvim/sessions/session.vim')
  end
end

return M