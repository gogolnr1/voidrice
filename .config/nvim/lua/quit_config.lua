local M = {}

M.setup = function()
  -- Modify quit behavior using QuitPre
  vim.api.nvim_create_autocmd('QuitPre', {
    callback = function()
      -- Get count of listed (regular) buffers
      local buffers = vim.fn.getbufinfo({buflisted = true})
      
      if #buffers > 1 then
        -- If there are multiple buffers, just close the current one
        vim.cmd('bdelete')
        -- Return false to prevent the original quit command from executing
        return false
      end
      -- For the last buffer, allow normal quit behavior
      return true
    end,
  })
end

return M
