return {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
