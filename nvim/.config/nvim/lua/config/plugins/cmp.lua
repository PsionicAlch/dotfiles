return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- only load when you enter insert mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- completions from your language server
      "hrsh7th/cmp-buffer",     -- completions from words in current buffer
      "hrsh7th/cmp-path",       -- completions for file paths
      "L3MON4D3/LuaSnip",       -- snippet engine (required by cmp)
      "saadparwaiz1/cmp_luasnip", -- connects luasnip to cmp
      "rafamadriz/friendly-snippets", -- a big collection of useful snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- load the friendly-snippets collection
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- ── Keymaps ──────────────────────────────────
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- move up in list
          ["<C-j>"] = cmp.mapping.select_next_item(), -- move down in list
          ["<C-d>"] = cmp.mapping.scroll_docs(4),     -- scroll docs down
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),    -- scroll docs up
          ["<C-Space>"] = cmp.mapping.complete(),     -- trigger completion manually
          ["<C-e>"] = cmp.mapping.abort(),            -- close completion
          ["<CR>"] = cmp.mapping.confirm({
            select = false, -- only confirm if you explicitly selected something
                            -- prevents accidentally confirming on Enter
          }),
          -- Tab to confirm if something is selected
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() -- jump to next snippet placeholder
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        -- ── Sources ──────────────────────────────────
        -- order matters — higher priority sources appear first
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- language server suggestions
          { name = "luasnip" },  -- snippets
          { name = "buffer" },   -- words from current file
          { name = "path" },     -- file paths
        }),

        -- ── Appearance ───────────────────────────────
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = function(entry, item)
            -- shows where the suggestion came from
            local source_names = {
              nvim_lsp = "[LSP]",
              luasnip  = "[Snip]",
              buffer   = "[Buf]",
              path     = "[Path]",
            }
            item.menu = source_names[entry.source.name]
            return item
          end,
        },
      })
    end,
  },
}
