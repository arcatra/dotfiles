return {
    'nvim-treesitter/nvim-treesitter',
    tag = "v0.10.0",
    lazy = false,
    build = ':TSUpdate',
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "python",
                "bash",
                "javascript",
                "lua",
                "java",

          },
          auto_install = false,
          -- sync_install = false,
          highlight = { enable = true },
          indent = { enable = false },
          autotag = { enable = true },

      })
  end

}
