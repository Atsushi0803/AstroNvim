local os_name = vim.loop.os_uname().sysname
local plugin_path

if os_name == "Linux" then
  -- OSを詳細に判別する
  if vim.fn.filereadable("/etc/os-release") == 1 then
    local os_release = vim.fn.readfile("/etc/os-release")
    for _, line in ipairs(os_release) do
      if line:match("suse") then
        plugin_path = "/usr/share/doc/packages/global/"
        break
      elseif line:match("debian") or line:match("ubuntu") then
        plugin_path = "/usr/share/vim/addons/plugin/"
        break
      end
    end
  end
end

-- プラグインパスが未設定の場合
if not plugin_path then
  vim.notify("Failed to determine the plugin path for gtags.vim. Plugin will not be loaded.", vim.log.levels.ERROR)
  return {}
end

-- 現在のディレクトリに GTAGS ファイルが存在する場合に gtags --single-update を実行
vim.api.nvim_create_autocmd({"BufWritePost", "BufAdd", "BufDelete"}, {
  pattern = "*",
  callback = function()
    local current_dir = vim.fn.getcwd() -- 現在の作業ディレクトリ
    if vim.fn.filereadable(current_dir .. '/GTAGS') == 1 then
      vim.cmd("silent !gtags --single-update " .. vim.fn.expand("<afile>:p"))
    end
  end,
})

-- プラグインの読み込み
return {
  dir = plugin_path,
  config = function()
    if vim.fn.filereadable(plugin_path .. "gtags.vim") == 1 then
      vim.cmd("source " .. plugin_path .. "gtags.vim")
    else
      vim.notify("Gtags plugin file not found: " .. plugin_path, vim.log.levels.ERROR)
    end
  end,
}
