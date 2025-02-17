local function smart_home()
  -- カーソルがある行を文字列で取得
  local line = vim.api.nvim_get_current_line()
  -- 現在のカーソル位置を取得
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- 先頭にある空白と制御文字(タブ)にマッチさせる。戻り値はマッチした文字列または nil
  local m = line:match('^[%s%c]+')
  -- カーソルを移動させる(三項演算子で読みづらいけどluaでよく見るので)
  vim.api.nvim_win_set_cursor(0, (m ~= nil and (col == 0 or m:len() < col)) and { row, m:len() } or { row, 0 })
end

vim.api.nvim_set_keymap('n', '<Home>', '', { callback = smart_home })
vim.api.nvim_set_keymap('i', '<Home>', '', { callback = smart_home })
vim.api.nvim_set_keymap('v', '<Home>', '', { callback = smart_home })

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

vim.api.nvim_set_keymap("n", "euc", ":e ++enc=auc-jp<CR>", { noremap = true, silent = true })
