-- ~/.config/nvim/lua/arcatra/plugins/dap.lua
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio", -- Required dependency for modern dap-ui
            "williamboman/mason.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Initialize the Debugger UI layout properties
            dapui.setup()

            -- Automatically open the UI panels when a debugging session initializes
            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

            -- 1. Debugger Configurations for C / C++ / Rust (using GDB or LLDB)
            -- We expect 'gdb' to be available on your Linux Mint path environment
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "mi" },
            }

            dap.configurations.c = {
                {
                    name = "Launch Executable (GDB)",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to binary executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
            }

            --           keys = {
            --   { "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
            --   { "<leader>db", function() dap.toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            --   { "<leader>dc", function() dap.continue() end, desc = "Run/Continue" },
            --   { "<leader>dg", function() dap.goto_() end, desc = "Go to Line (No Execute)" },
            --   { "<leader>di", function() dap.step_into() end, desc = "Step Into" },
            --   { "<leader>dj", function() dap.down() end, desc = "Down" },
            --   { "<leader>dk", function() dap.up() end, desc = "Up" },
            --   { "<leader>dl", function() dap.run_last() end, desc = "Run Last" },
            --   { "<leader>do", function() dap.step_out() end, desc = "Step Out" },
            --   { "<leader>dO", function() dap.step_over() end, desc = "Step Over" },
            --   { "<leader>dP", function() dap.pause() end, desc = "Pause" },
            --   { "<leader>dr", function() dap.repl.toggle() end, desc = "Toggle REPL" },
            --   { "<leader>ds", function() dap.session() end, desc = "Session" },
            --   { "<leader>dt", function() dap.terminate() end, desc = "Terminate" },
            --   { "<leader>dw", function() dapui.hover() end, desc = "Widgets" },
            -- },
            -- Set up global debugging hotkeys
            local keymap = vim.keymap
            keymap.set("n", "<leader>ds", function() dap.continue() end, { desc = "Debugger: Start/Continue" })
            keymap.set("n", "<leader>dj", function() dap.down() end, { desc = "Debugger: Down" })
            keymap.set("n", "<leader>dk", function() dap.step_over() end, { desc = "Debugger: Up" })
            keymap.set("n", "<leader>dv", function() dap.step_over() end, { desc = "Debugger: Step Over" })
            keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Debugger: Step Into" })
            keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Debugger: Step Out" })
            keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end,
                { desc = "Debugger: Toggle Breakpoint" })
            keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
                { desc = "Debugger: Conditional Breakpoint" })
            keymap.set("n", "<leader>dr", function() dap.repl.open() end, { desc = "Debugger: Open REPL console" })
            keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Debugger: Toggle UI Interface" })
        end,
    }
}
