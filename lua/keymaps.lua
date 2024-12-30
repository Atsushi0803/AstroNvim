vim.keymap.set("n", "gd", function()
  -- 現在のカーソル位置にある単語を取得
  local word = vim.fn.expand("<cword>")
  -- :Gtags コマンドを実行
  vim.cmd("Gtags " .. word)
end, { noremap = true, silent = true })

vim.keymap.set("n", "gr", function()
  -- 現在のカーソル位置にある単語を取得
  local word = vim.fn.expand("<cword>")
  -- :Gtags -r コマンドを実行
  vim.cmd("Gtags -r " .. word)
end, { noremap = true, silent = true })
