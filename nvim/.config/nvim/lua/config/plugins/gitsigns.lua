return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- only load when opening a file
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "▎" }, -- new line
        change       = { text = "▎" }, -- modified line
        delete       = { text = "" }, -- deleted line
        topdelete    = { text = "" }, -- deleted first line
        changedelete = { text = "▎" }, -- changed then deleted
        untracked    = { text = "▎" }, -- not yet tracked by git
      },

      -- ── Keymaps ──────────────────────────────────────
      on_attach = function(bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr }

        -- navigate between hunks (a hunk is a block of changes)
        map("n", "]h", require("gitsigns").next_hunk, opts)
        map("n", "[h", require("gitsigns").prev_hunk, opts)

        -- stage/reset individual hunks without opening lazygit
        map("n", "<leader>hs", require("gitsigns").stage_hunk, opts)
        map("n", "<leader>hr", require("gitsigns").reset_hunk, opts)

        -- show who wrote a line (git blame)
        map("n", "<leader>hb", require("gitsigns").blame_line, opts)

        -- show the diff of the current file
        map("n", "<leader>hd", require("gitsigns").diffthis, opts)
      end,
    })
  end,
}
