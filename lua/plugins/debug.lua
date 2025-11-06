return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        dapui.setup()
        require('dap-go').setup()
        vim.keymap.set('n', '<F5>', function() dap.continue() end)
        vim.keymap.set('n', '<F10>', function() dap.step_over() end)
        vim.keymap.set('n', '<F11>', function() dap.step_into() end)
        vim.keymap.set('n', '<F12>', function() dap.step_out() end)
        vim.keymap.set('n', '<Leader>bb', function() dap.toggle_breakpoint() end)
        -- vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
        -- vim.keymap.set('n', '<Leader>lp',
        --     function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        vim.keymap.set('n', '<Leader>br', function() dap.repl.open() end)
        vim.keymap.set('n', '<Leader>bl', function() dap.run_last() end)
        vim.keymap.set('n', '<Leader>bt', function() dapui.toggle() end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>bh', function()
            require('dap.ui.widgets').hover()
        end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>bp', function()
            require('dap.ui.widgets').preview()
        end)

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end
}
