local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.clipboard:append("unnamedplus")

local options = {
    laststatus = 3,
    ruler = false,
    showmode = false,
    showcmd = false,
    wrap = true,
    cursorline = true,
    scrolloff = 8,
    sidescrolloff = 10,

    smoothscroll = true,
    title = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,

    signcolumn = "yes",
    showmatch = true,
    cmdheight = 1,
    pumheight = 10,
    pumblend = 10,
    winblend = 0,
    conceallevel = 2,
    synmaxcol = 300,
    fillchars = { eob = " " },

    hidden = true,
    errorbells = false,
    backspace = "indent,eol,start",
    autochdir = false,
    selection = "inclusive",
    mouse = "a",
    modifiable = true,

    guicursor =
    "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",

    backup = false,
    writebackup = false,
    swapfile = false,
    undofile = true,
    undodir = undodir,
    updatetime = 300,
    timeoutlen = 500,
    ttimeoutlen = 50,
    autoread = true,
    autowrite = false,

    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,

    foldmethod = "expr",
    foldlevel = 99,
    foldexpr = "v:lua.vim.treesitter.foldexpr()",

    termguicolors = true,
    concealcursor = "nc",
    splitkeep = "screen",

    wildmenu = true,
    wildmode = "longest:full,full",
    redrawtime = 100, -- Safe value prevents editor interface freezing
    maxmempattern = 20000,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.diagnostic.config({
    signs = false,
})
