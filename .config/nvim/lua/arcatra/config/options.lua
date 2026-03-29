local opt = vim.opt

-- Buffer config
opt.showcmd = true
opt.modifiable = true
opt.autowrite = true
opt.cursorline = true
opt.autoread = true

opt.smartcase = true

opt.wrap = false

-- line numbers
opt.number = true
opt.relativenumber = true

-- tab space
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true

--tremGui
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift


-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
