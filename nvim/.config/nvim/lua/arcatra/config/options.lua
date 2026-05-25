local opt = vim.opt

-- Buffer config
opt.showcmd = true
opt.modifiable = true
opt.smartcase = true
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.autowrite = true
opt.autoread = true

-- cursor
opt.cursorline = true
opt.guicursor = "n-v-i-c:block"

-- tab space
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true
opt.expandtab = true
opt.smartindent = true

--tremGui
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift


-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
vim.g.netrw_fastbrowse = 0
-- opt.splitkeep = "cursor"

-- turn off swapfile
opt.swapfile = false

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "h" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.expandtab = true
    end,
})
