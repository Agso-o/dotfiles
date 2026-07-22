return {
  "stevearc/dressing.nvim",
  config = function()
    require("dressing").setup({
      input = {
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    })
  end
}
