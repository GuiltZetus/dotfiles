return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   event = "VeryLazy",
  --   dependencies = { "nvim-lspconfig" },
  --   config = function()
  --     require "configs.mason-lspconfig"
  --   end,
  -- },
}
