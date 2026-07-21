vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set("n", "<leader>cr", function()
  -- Pega o tipo do arquivo, o nome com extensão (ex: main.cpp) e sem extensão (ex: main)
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%")
  local filename_no_ext = vim.fn.expand("%:r")
  local cmd = ""

  if filetype == "cpp" then
    cmd = string.format("g++ %s -o %s && ./%s", filename, filename_no_ext, filename_no_ext)
  elseif filetype == "go" then
    cmd = string.format("go run %s", filename)
  else
    print("Linguagem não configurada para rodar!")
    return
  end

  vim.cmd("TermExec cmd='" .. cmd .. "'")
end, { desc = "Rodar código" })
