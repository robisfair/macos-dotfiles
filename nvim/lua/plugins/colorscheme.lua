return {
  {
    "savq/melange-nvim",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 999,
    opts = {
      variant = "moon",
      styles = {
        transparency = false,
      },
    },
  },
  {
    "neanias/everforest-nvim",
    priority = 998,
    config = function()
      require("everforest").setup({
        style = "dark",
        background = "hard",
        transparent_background_level = 1,
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 997,
  },
  {
    "shaunsingh/nord.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
