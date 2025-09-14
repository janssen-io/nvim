vim.g.mapleader = " "

-- open explorer / file tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- close current buffer
vim.keymap.set("n", "<leader>q", ":bd<CR>")

-- delete selection, but don't put it into a register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- move lines while in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
