return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      auto_integrations = true,
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    opts = {
      filter = "octagon",
    },
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      style = "darker",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- colorscheme = "monokai-pro",
      -- colorscheme = "onedark",
    },
  },
}
