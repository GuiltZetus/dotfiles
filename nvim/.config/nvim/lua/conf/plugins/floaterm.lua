return  {
  "voldikss/vim-floaterm",
  lazy = false, -- load immediately
  config = function()
    -- Floaterm settings (optional but useful)
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_wintitle = 0
    vim.g.floaterm_autoclose = 2

    -- Keymaps
    -- Toggle terminal
    vim.keymap.set("n", "<C-`>", ":FloatermToggle<CR>", { noremap = true, silent = true, desc = "Toggle terminal" })
    vim.keymap.set("t", "<C-`>", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true, desc = "Toggle terminal" })
    -- Create a new terminal (Ctrl + T)
    vim.keymap.set("n", "<C-t>", ":FloatermNew<CR>", { noremap = true, silent = true, desc = "New Floaterm" })
    vim.keymap.set("t", "<C-t>", "<C-\\><C-n>:FloatermNew<CR>", { noremap = true, silent = true, desc = "New Floaterm" })
    -- Cycle between terminals
    vim.keymap.set("n", "<Tab>", ":FloatermNext<CR>", { noremap = true, silent = true, desc = "Next terminal" })
    vim.keymap.set("n", "<S-Tab>", ":FloatermPrev<CR>", { noremap = true, silent = true, desc = "Prev terminal" })
    vim.keymap.set("t", "<Tab>", "<C-\\><C-n>:FloatermNext<CR>", { noremap = true, silent = true })
    vim.keymap.set("t", "<S-Tab>", "<C-\\><C-n>:FloatermPrev<CR>", { noremap = true, silent = true })
  end,
}
