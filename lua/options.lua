vim.g.clipboard = {
  name = "xclip",
  copy = {
    ["+"] = "xclip -selection clipboard",
    ["*"] = "xclip -selection clipboard",
  },
  paste = {
    ["+"] = "xclip -selection clipboard -o",
    ["*"] = "xclip -selection clipboard -o",
  },
  cache_enabled = 1,
}

vim.opt.relativenumber = false
vim.opt.wildmode = {"list", "longest"}
vim.opt.wildmenu = true

vim.opt.fileencodings = "utf-8, euc-jp"
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
