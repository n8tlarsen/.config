return {
    {
        'mfussenegger/nvim-dap',
        config = function ()
            local dap = require('dap')
            vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint)
            vim.keymap.set('n', '<Leader>dc', dap.continue)
            vim.keymap.set('n', '<Leader>dd', dap.terminate)
            vim.keymap.set('n', '<Leader>dj', dap.step_over)
            vim.keymap.set('n', '<Leader>dh', dap.step_out)
            vim.keymap.set('n', '<Leader>dl', dap.step_into)
        end,
        opts = {},
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function ()
            local dap, dapui = require("dap"), require("dapui")
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
            dapui.setup() -- required even though Lazy typically calls this
        end,
    }
}
