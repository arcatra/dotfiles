-- leader 
vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '
local keymap = vim.keymap

-- keybinds 
keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search" })
keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = "Open file explorer in nvim" })
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab



