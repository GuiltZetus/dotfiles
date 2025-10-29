return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      -- Automatically close tree after opening a file
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })

    -- Keymap: Toggle NvimTree with Ctrl+n
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end,
}

