return {
  {
    "zbirenbaum/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true }, -- Disable ghost text suggestions
        panel = { enabled = false },

      })
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  -- (Optional) If you want Copilot suggestions to show up in the nvim-cmp dropdown menu
  -- You must also have 'zbirenbaum/copilot.lua' installed, which is usually a dependency
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.vim",
  },

  -- This block loads your new nvim-cmp config file
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot-cmp" },
    config = function()
      require("configs.nvim-cmp") -- This is the updated require path
    end,
  },
}
