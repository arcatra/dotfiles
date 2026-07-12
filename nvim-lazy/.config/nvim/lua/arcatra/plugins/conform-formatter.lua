return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "n",
            desc = "Format buffer",
        },
    },
    dependencies = {
        -- The bridge plugin that automatically connects conform to mason
        {
            "zapling/mason-conform.nvim",
            dependencies = { "williamboman/mason.nvim" },
            opts = {
                -- Ensures anything declared in formatters_by_ft below gets auto-installed by Mason
                automatic_installation = true,
                -- If there are formatters you want to ignore because you installed them via pacman instead
                -- ignore_install = { "zigfmt" },
            },
        },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },

            -- Full-Stack Web Development Core & Frameworks
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            json = { "prettier" },

            -- Go & Zig Formatting
            go = { "goimports", "gofmt" },
            zig = { "zigfmt" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        format_on_save = { timeout_ms = 500 },
        formatters = {
            shfmt = {
                append_args = { "-i", "2" },
            },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
