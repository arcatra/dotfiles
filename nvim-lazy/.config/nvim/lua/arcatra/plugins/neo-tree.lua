-- ~/.config/nvim/lua/arcatra/plugins/neotree.lua
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        -- Lazy load Neo-tree only when you explicitly invoke the command or shortcut
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true, -- Shows hidden files (like .env or .gitignore) with dimmed opacity
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    enabled = true, -- Automatically focuses and highlights the active file in the sidebar tree
                },
            },
            window = {
                width = 40, -- Adjust the sidebar layout expansion width to your preference
            },
        },
    }
}
