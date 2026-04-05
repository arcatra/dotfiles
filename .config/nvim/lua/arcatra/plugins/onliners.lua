return {
    { -- Git plugin
        "tpope/vim-fugitive",
    },

    { -- Show css colors
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({})
        end

    },

    -- { --drex treesitter
    --     'theblob42/drex.nvim',
    --     dependencies = { 'nvim-tree/nvim-web-devicons' }
    -- },
}
