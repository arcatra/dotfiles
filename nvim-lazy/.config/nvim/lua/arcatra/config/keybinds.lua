local function map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = false, })
end

-- set leader
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- universal
map("n", "<leader>h", ":nohlsearch<CR>") -- Clear search
-- map("n", "<leader>cd", ":Ex<CR>")        -- Open file explorer in nvim

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
map('n', '<A-.>', '<Cmd>BufferNext<CR>')

-- Re-order to previous/next
map('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A-l>', '<Cmd>BufferMoveNext<CR>')

-- Neo tree
map("n", "<leader>cd", "<cmd>Neotree toggle filesystem left<cr>")

-- buffers
map("n", "<leader>q", ":BufferClose<CR>")
map("n", "<leader>Q", ":BufferClose!<CR>")
map("n", "<leader>U", "::bufdo bd<CR>")         --close all

map('n', '<leader>vs', ':vsplit<CR>:bnext<CR>') --ver split + open next buffer
map('n', '<leader>hs', ':split<CR>:bnext<CR>')  --ver split + open next buffer
map('n', '<leader>ll', '<C-w>h')                -- Switch cursor to left window
map('n', '<leader>rr', '<C-w>l')                -- Switch cursor to right window
map('n', '<leader>tt', '<C-w>k')                -- Switch cursor to top window
map('n', '<leader>bb', '<C-w>j')                -- Switch cursor to bottom window

-- buffer position nav + reorder
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
map('n', '<A-0>', '<Cmd>BufferLast<CR>')
map('n', '<A-p>', '<Cmd>BufferPin<CR>')
