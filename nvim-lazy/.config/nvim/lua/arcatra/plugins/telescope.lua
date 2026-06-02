-- ~/.config/nvim/lua/arcatra/plugins/telescope.lua
return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local builtin = require('telescope.builtin')

        -- Keymaps configured to include hidden files but ignore the .git folder
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files({ hidden = true, no_ignore = false })
        end, { desc = 'Telescope find files (including hidden)' })

        vim.keymap.set('n', '<leader>fg', function()
            builtin.live_grep({
                additional_args = function()
                    return { "--hidden" }
                end
            })
        end, { desc = 'Telescope live grep (including hidden)' })

        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
}
