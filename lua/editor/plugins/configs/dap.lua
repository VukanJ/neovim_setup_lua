return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "jay-babu/mason-nvim-dap.nvim",
            event = "VeryLazy",
            dependencies = {
                "williamboman/mason.nvim",
            },
            opts = { handlers = {}, }
        },
        {
            "rcarriga/nvim-dap-ui",
            dependencies = "mfussenegger/nvim-dap",
            event = "VeryLazy",
            config = function()
                local dap = require("dap")
                local dapui = require("dapui")

                dapui.setup()
                dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
                dap.listeners.after.event_terminated["dapui_config"] = function() dapui.close() end
                dap.listeners.after.event_exited["dapui_config"] = function() dapui.close() end
                dap.configurations.cpp = {
                    {
                        type = "cpp";
                        request = "launch";
                        name = "Launch file";
                        program = "build/nav";
                    }
                }
                dap.adapters.cpp = {
                    type = 'executable',
                    command = 'codelldb', -- adjust as needed, must be absolute path
                    name = "lldb"
                }

                vim.keymap.set("n", "<F12>", function() require'dap'.toggle_breakpoint() end)
                vim.keymap.set("n", "<F2>", function()
                    require'dap'.continue()
                    require'dapui'.open()
                    vim.opt.cursorline = true
                end)
                vim.keymap.set("n", "<F5>", function() require'dap'.step_over() end)
                vim.keymap.set("n", "<F6>", function() require'dap'.step_into() end)
                vim.keymap.set("n", "<F9>", function() require'dap'.continue() end)
                vim.keymap.set("n", "<F3>", function()
                    require'dap'.close()
                    require'dapui'.close()
                    vim.opt.cursorline = false
                end)
            end

        },
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    }
}
