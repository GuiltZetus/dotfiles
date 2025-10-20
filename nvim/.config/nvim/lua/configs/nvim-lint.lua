-- Manual nvim-lint configuration
local lint = require "lint"

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  python = { "ruff" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
  callback = function()
    pcall(function()
      lint.try_lint()
    end)
  end,
})

local function set_qflist_from_diagnostics()
  local diagnostics = vim.diagnostic.get(0)
  if #diagnostics > 0 then
    local qf_items = vim.diagnostic.toqflist(diagnostics)
    vim.fn.setqflist({}, " ", { title = "Current Buffer Diagnostics", items = qf_items })
    vim.cmd "copen"
    vim.notify('Diagnostics loaded into Quickfix list. Use "+y to copy.', vim.log.levels.INFO)
  else
    vim.notify("No diagnostics found in the current buffer.", vim.log.levels.INFO)
  end
end

vim.keymap.set("n", "<Leader>dl", set_qflist_from_diagnostics, { desc = "List Diagnostics in Quickfix" })
vim.opt.clipboard = "unnamedplus"
