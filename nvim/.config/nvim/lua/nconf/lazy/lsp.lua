return {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 4,
      },
      signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN]  = "󰀪 ",
            [vim.diagnostic.severity.HINT]  = "󰌶 ",
            [vim.diagnostic.severity.INFO]  = "󱀡 ",
          },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focused = false,
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir para o erro anterior" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir para o próximo erro" })
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Ver erro detalhado" })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "lua_ls",
        "rust_analyzer",
      },

      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,

            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },

                diagnostics = {
                  globals = {
                    "vim",
                  },
                },

                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                },
              },
            },
          })
        end,
      },
    })
  end,
}
