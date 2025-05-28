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
                        program = "${file}";
                    }
                }
            end
        },
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    }
}
