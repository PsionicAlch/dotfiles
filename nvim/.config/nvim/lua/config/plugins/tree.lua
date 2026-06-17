return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.5

    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      respect_buf_cwd = true,
      sync_root_with_cwd = true,
      view = {
        width = 35,
        side = "left",
        relativenumber = true,
      },
      renderer = {
        group_empty = true,
        icons = {
          glyphs = {
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
  end,
}
