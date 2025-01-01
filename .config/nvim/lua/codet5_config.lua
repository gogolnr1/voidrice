local M = {}

M.setup = function()
  -- CodeT5 completion function
  _G.codet5_complete_async = function()
    local code_input = vim.fn.getline('.')
    local command = 'python3 ~/.local/bin/huggingface_codet5.py ' .. vim.fn.shellescape(code_input)

    vim.fn.jobstart(command, {
      on_stdout = function(_, data)
        if data then
          local completion = table.concat(data, '\n')
          vim.api.nvim_out_write(completion .. '\n')
        end
      end,
      on_stderr = function(_, data)
        if data then
          vim.api.nvim_err_writeln("Error: " .. table.concat(data, '\n'))
        end
      end
    })
  end

  -- Set up keybinding for CodeT5
  vim.keymap.set('n', '<leader>ct', ':lua codet5_complete_async()<CR>', { noremap = true, silent = true })

  -- Auto-setup for Python files
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      vim.opt_local.completefunc = "v:lua.codet5_complete"
    end,
  })
end

return M