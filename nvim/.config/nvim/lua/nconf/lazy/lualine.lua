return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Usa os ícones que você já tem
  config = function()
    vim.opt.showmode = false

    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "NvimTree" },
        },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = " ", right = " " }, right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = { "diagnostics" },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { left = " ", right = "" }, left_padding = 2 },
        },
      },
    })
  end,
}
