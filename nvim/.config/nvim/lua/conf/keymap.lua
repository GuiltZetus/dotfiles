--Keymap settings

--Move highlight line in visual mode up and down 1 line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--selected word in Normal mode will be replace through the entire file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Tabbing between buffer and splitting tab
vim.keymap.set("n", "<Tab>" ,":bnext<CR>")
vim.keymap.set("n", "<S-Tab>" ,":bprevious<CR>")

vim.keymap.set("n", "<leader>bv", function()
  require("telescope.builtin").buffers {
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local actions = require("telescope.actions")
        local state = require("telescope.actions.state")
        local selection = state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.cmd("vsplit")
        vim.cmd("buffer " .. selection.bufnr)
      end)
      return true
    end,
  }
end, { desc = "Telescope: vsplit buffer picker" })

vim.keymap.set("n", "<leader>bh", function()
  require("telescope.builtin").buffers {
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local actions = require("telescope.actions")
        local state = require("telescope.actions.state")
        local selection = state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.cmd("split")
        vim.cmd("buffer " .. selection.bufnr)
      end)
      return true
    end,
  }
end, { desc = "Telescope: horizontal split buffer picker" })

-- Resize splits
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

--blinking flash when yanking/copying text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
