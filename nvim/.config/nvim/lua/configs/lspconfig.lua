-- Modern Neovim LSP configuration for nvim-lspconfig v2+ and Neovim 0.11+
-- Using vim.lsp.config instead of require('lspconfig')

-- Setup capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Common on_attach function
local on_attach = function(client, bufnr)
  -- Set up keymaps
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

-- Disable diagnostics for a server
local disable_diagnostics = function(client, bufnr)
  client.handlers["textDocument/publishDiagnostics"] = function() end
  on_attach(client, bufnr)
end

-- Configure lua_ls
vim.lsp.config("lua_ls", {
  root_dir = vim.fs.dirname(vim.fs.find({ "lua_ls" }, { upward = true })[1] or ""),
  settings = {
    Lua = {
      diagnostics = {
        enable = false,
        -- globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/love2d/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

vim.lsp.enable({ "lua_ls" }, {
  on_attach = disable_diagnostics,
  capabilities = capabilities,
})

-- Configure clangd
vim.lsp.config("clangd", {
  root_dir = vim.fs.dirname(vim.fs.find({ "clangd" }, { upward = true })[1] or ""),
})

vim.lsp.enable({ "clangd" }, {
  on_attach = function(client, bufnr)
    -- Disable formatting
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- Disable diagnostics
    client.handlers["textDocument/publishDiagnostics"] = function() end
    -- Call common on_attach for keymaps
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

-- Configure tsserver
vim.lsp.config("tsserver", {
  root_dir = vim.fs.dirname(vim.fs.find({ "tsserver" }, { upward = true })[1] or ""),
})

vim.lsp.enable({ "tsserver" }, {
  on_attach = disable_diagnostics,
  capabilities = capabilities,
})
