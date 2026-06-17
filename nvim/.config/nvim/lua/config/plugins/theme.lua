return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000, -- load this before all other plugins
                   -- so colors are set before anything else renders
  config = function()
    require("gruvbox").setup({
      terminal_colors = true, -- apply gruvbox colors to the built-in terminal too
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,    -- italicize strings
        emphasis = true,
        comments = true,   -- italicize comments
        operators = false,
        folds = true,
      },
      contrast = "",      
      dim_inactive = true, -- slightly dim splits that aren't focused
      transparent_mode = true,
    })

    -- actually apply the theme
    vim.o.background = "dark"
    vim.cmd("colorscheme gruvbox")
  end,
}
