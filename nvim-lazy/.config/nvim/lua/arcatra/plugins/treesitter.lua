return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        opts = {
            ensure_installed = {
                -- primary languages
                "python", "bash", "javascript", "html", "css",
                "c", "java", "typescript", "sql", "lua",

                -- Neovim / Config / Docs
                "vim", "vimdoc", "query", "markdown",
                "markdown_inline", "json", "yaml", "toml",

                -- Utility
                "regex", "comment", "diff", "dockerfile",
            },
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        },
        -- The broken 'config' function block has been removed entirely.
        -- Lazy will now automatically pass 'opts' to the new setup method.
    },

    {
        "windwp/nvim-ts-autotag",
        opts = {},
    }
}
