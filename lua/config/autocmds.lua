-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c", -- c文件
  callback = function()
    vim.opt_local.tabstop = 4 -- 一个tab显示为4个空格
    vim.opt_local.shiftwidth = 4 -- 自动缩进时使用4个空格
    vim.opt_local.expandtab = true -- 使用空格代替tab
    vim.opt.softtabstop = 4 -- 控制输入和删除时的「感知宽度」，按tab键等效输入4个空格
  end,
})
