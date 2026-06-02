return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            background = { light = "latte", dark = "mocha" },
            transparent_background = false,
            float = { transparent = false, solid = false },
            show_end_of_buffer = false,
            term_colors = false,
            dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = { "italic" },
                keywords = { "italic" },
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            custom_highlights = function(colors)
                local bg_color = "#0B0E14"
                return {
                    Normal = { bg = bg_color },
                    NormalNC = { bg = bg_color },
                    NormalFloat = { bg = bg_color },
                    FloatBorder = { bg = bg_color },
                    TelescopeNormal = { bg = bg_color },
                    LazyNormal = { bg = bg_color },
                    MasonNormal = { bg = bg_color },
                    Pmenu = { bg = bg_color },
                }
            end,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                notify = false,
                mini = { enabled = true, indentscope_color = "" },
            },
        })
        vim.cmd.colorscheme "catppuccin-nvim"
    end
}
