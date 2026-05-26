return {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        { "windwp/nvim-ts-autotag", opts = {} },
    },
    -- Defining settings in 'opts' maps perfectly to the TSConfig type structure
    opts = {
        ensure_installed = {
            -- primary languages
            "python",
            "bash",
            "javascript",
            "html",
            "css",
            "c",
            "java",
            "typescript",
            "sql",
            "lua",

            -- Neovim / Config / Docs
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
            "json",
            "yaml",
            "toml",

            -- Utility
            "regex",
            "comment",
            "diff",
            "dockerfile",
        },
        auto_install = true,
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        autotag = { enable = true },
    },
    -- This config function pipes 'opts' straight to Treesitter, silencing the LSP
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
