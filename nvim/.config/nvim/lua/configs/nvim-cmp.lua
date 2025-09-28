-- This file configures nvim-cmp for Copilot integration

local cmp = require("cmp")
local luasnip = require("luasnip")

local has_copilot, copilot_cmp = pcall(require, "copilot_cmp")

cmp.setup({
  sources = {
    has_copilot and { name = "copilot" } or nil,
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
})
