-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 缩进设置：4个空格
vim.opt.tabstop = 4 -- Tab键显示为4个空格宽度
vim.opt.shiftwidth = 4 -- 自动缩进（如if/for块）的宽度为4
vim.opt.expandtab = true -- 将输入的Tab键自动转为空格（避免混合缩进）
vim.opt.softtabstop = 4 -- 插入模式下，按Tab键等效输入4个空格
vim.opt.smartindent = true -- 开启智能缩进（根据语法自动调整缩进，如代码块）
