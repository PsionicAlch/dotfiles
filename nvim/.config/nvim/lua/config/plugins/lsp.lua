return {
  -- ── Mason: installs language servers ───────────────────
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- ── Mason-lspconfig: bridges mason and lspconfig ───────
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "astro",
          "html",
          "cssls",
          "lua_ls",
        },
        automatic_installation = true,
      })
    end,
  },

  -- ── LSP config: uses built-in vim.lsp.config ───────────
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- keymaps when LSP attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = vim.keymap.set
          local opts = { buffer = event.buf }

          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          map("n", "<leader>d", vim.diagnostic.open_float, opts)
          map("n", "[d", vim.diagnostic.goto_prev, opts)
          map("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })

      -- configure servers using the new built-in API
      vim.lsp.config("ts_ls", {})
      vim.lsp.config("astro", {})
      vim.lsp.config("html", {})
      vim.lsp.config("cssls", {})
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- enable all configured servers
      vim.lsp.enable({ "ts_ls", "astro", "html", "cssls", "lua_ls" })
    end,
  },
}
