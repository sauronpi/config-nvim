return {
  "keaising/im-select.nvim",
  config = function()
    -- 检测当前操作系统
    local os_name = vim.uv.os_uname().sysname
    local default_im = ""
    local default_cmd = ""

    -- 根据系统设置默认值
    if os_name == "Darwin" then -- macOS
      -- 默认英文输入法 ID（可通过 `im-select` 命令获取）
      default_im = "com.apple.keylayout.ABC"
      -- macOS 切换工具（官方默认 "macism"，也可使用 "im-select"）
      default_cmd = "macism" -- 若用 macism 可改为 "macism"
    elseif os_name == "Windows_NT" then -- Windows
      -- 默认英文输入法 ID（通常为 1033，可通过 `im-select.exe` 确认）
      default_im = "1033"
      -- Windows 切换工具（官方默认 "im-select.exe"）
      default_cmd = "im-select.exe"
    elseif os_name == "Linux" then -- Linux
      -- 检测 Linux 上的输入法框架（fcitx5/fcitx/ibus）
      -- 可根据实际使用的框架修改（通过 `fcitx5-remote -n` 或 `ibus engine` 确认 ID）
      local fcitx5_check = vim.fn.executable("fcitx5-remote")
      local fcitx_check = vim.fn.executable("fcitx-remote")
      local ibus_check = vim.fn.executable("ibus")

      if fcitx5_check == 1 then
        -- fcitx5 框架默认英文输入法 ID
        default_im = "keyboard-us"
        default_cmd = "fcitx5-remote"
      elseif fcitx_check == 1 then
        -- fcitx 框架默认英文输入法 ID（通常为 1 或 2，需自行确认）
        default_im = "2"
        default_cmd = "fcitx-remote"
      elseif ibus_check == 1 then
        -- ibus 框架默认英文输入法 ID
        default_im = "xkb:us::eng"
        default_cmd = "ibus"
      else
        -- 未检测到已知框架时的 fallback（需手动调整）
        default_im = "keyboard-us"
        default_cmd = "fcitx5-remote"
      end
    end
    require("im_select").setup({
      -- IM will be set to `default_im_select` in `normal` mode
      -- For Windows/WSL, default: "1033", aka: English US Keyboard
      -- For macOS, default: "com.apple.keylayout.ABC", aka: US
      -- For Linux, default:
      --               "keyboard-us" for Fcitx5
      --               "1" for Fcitx
      --               "xkb:us::eng" for ibus
      -- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
      -- default_im_select = "com.apple.keylayout.ABC",
      default_im_select = default_im,

      -- Can be binary's name, binary's full path, or a table, e.g. 'im-select',
      -- '/usr/local/bin/im-select' for binary without extra arguments,
      -- or { "AIMSwitcher.exe", "--imm" } for binary need extra arguments to work.
      -- For Windows/WSL, default: "im-select.exe"
      -- For macOS, default: "macism"
      -- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
      default_command = default_cmd,

      -- Restore the default input method state when the following events are triggered
      -- "VimEnter" and "FocusGained" were removed for causing problems, add it by your needs
      set_default_events = { "InsertLeave", "CmdlineLeave" },

      -- Restore the previous used input method state when the following events
      -- are triggered, if you don't want to restore previous used im in Insert mode,
      -- e.g. deprecated `disable_auto_restore = 1`, just let it empty
      -- as `set_previous_events = {}`
      set_previous_events = { "InsertEnter" },

      -- Show notification about how to install executable binary when binary missed
      keep_quiet_on_no_binary = false,

      -- Async run `default_command` to switch IM or not
      async_switch_im = true,
    })
  end,
}
