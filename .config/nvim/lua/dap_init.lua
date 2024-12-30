local dap = require('dap')

-- Define Python debug adapter
dap.adapters.python = {
  type = 'executable',
  command = '/usr/bin/python3', -- Adjust this if using a virtual environment or custom Python path
  args = { '-m', 'debugpy.adapter' },
}

-- Configure Python debugging
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}", -- This will debug the current file
    pythonPath = function()
      -- Use virtual environment if available, or fallback to system Python
      return os.getenv('VIRTUAL_ENV') and os.getenv('VIRTUAL_ENV') .. '/bin/python' or 'python3'
    end,
  },
}

-- Keybindings for DAP
vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Start/Continue debugging' })
vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'Step Into' })
vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = 'Step Out' })
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<Leader>dc', function() dap.clear_breakpoints() end, { desc = 'Clear Breakpoints' })
