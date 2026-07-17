return {
  "hrsh7th/nvim-cmp",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",
  },

  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),

      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          menu = {
            nvim_lsp = "[LSP]",
            luasnip  = "[Snippet]",
            path     = "[Path]",
            buffer   = "[Buffer]",
          }
        })
      },
    })
  end,
}
