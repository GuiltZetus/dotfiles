require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>bv", vim.cmd.vsplit, { desc = "Vertical Split Buffer" })
map("n", "<leader>bh", vim.cmd.vsplit, { desc = "Horizontal Split Buffer" })
map("n", "<C-h>", "<CR>:wincmd h<CR>", { desc = "Jump to left buffer" })
map("n", "<C-l>", "<CR>:wincmd l<CR>", { desc = "Jump to right buffer" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
