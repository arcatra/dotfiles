return {
    'nvim-treesitter/nvim-treesitter',
    version = '*',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            -- primary languages
            "python", "bash", "javascript", "java", "typescript", "sql", "lua",

            -- Neovim / Config / Docs
            "vim", "vimdoc", "query", "markdown", "markdown_inline", "json", "yaml", "toml",

            -- Utility
            "regex", "comment", "diff", "dockerfile"
        },
        auto_install = true,
        sync_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end

}
