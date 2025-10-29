-- lua/conf/plugins/mason.lua
return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })
    
    -- Setup mason-lspconfig with handlers
    require('mason-lspconfig').setup({
      -- List of servers to automatically install
      ensure_installed = {
        'lua_ls',      -- Lua
        'pyright',     -- Python
        'ts_ls',       -- TypeScript/JavaScript
        'rust_analyzer', -- Rust
        'gopls',       -- Go
      },
      automatic_installation = true,
      
      -- Setup handlers here (this is the correct place)
      handlers = {
        -- Default handler - will be called for each installed server
        function(server_name)
          -- This will be overridden by lsp-config.lua if it has custom config
          vim.lsp.enable(server_name)
        end,
      },
    })
  end,
}
