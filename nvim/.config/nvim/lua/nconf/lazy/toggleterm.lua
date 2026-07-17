return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      direction = "float",
      close_on_exit = true,
    })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}
