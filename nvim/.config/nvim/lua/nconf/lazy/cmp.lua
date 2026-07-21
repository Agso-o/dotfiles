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
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<Return>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),

      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
      },

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)

          local kind = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
          })(entry, vim_item)

          kind.kind = " " .. (kind.kind or "") .. " "

          local menu_name = ({
            nvim_lsp = "LSP",
            luasnip  = "Snippet",
            path     = "Path",
            buffer   = "Buffer",
          })[entry.source.name]

          kind.menu = "    [" .. (menu_name or "") .. "]"
          
          return kind 
      end,
        
      },
    })
  end,
}
