local opt = vim.opt            -- shorthand so we don't type vim.opt every time

-- ── Line numbers ───────────────────────────────────────
opt.number = true              -- show line numbers
opt.relativenumber = true      -- show relative numbers (great for vim motions, e.g. 5j jumps 5 lines down)

-- ── Tabs & indentation ─────────────────────────────────
opt.tabstop = 2                -- tab = 2 spaces (standard for JS/TS)
opt.shiftwidth = 2             -- indent = 2 spaces
opt.expandtab = true           -- use spaces instead of actual tab characters
opt.smartindent = true         -- auto indent based on the language

-- ── Appearance ─────────────────────────────────────────
opt.termguicolors = true       -- enables full 24-bit color (required for gruvbox)
opt.signcolumn = "yes"         -- always show the sign column (where git signs and errors appear)
                               -- without this the editor jumps left/right as signs appear
opt.cursorline = true          -- highlight the line your cursor is on
opt.scrolloff = 8              -- keep 8 lines above/below cursor when scrolling
opt.wrap = false               -- don't wrap long lines

-- ── Search ─────────────────────────────────────────────
opt.ignorecase = true          -- case insensitive search...
opt.smartcase = true           -- ...unless you type a capital letter

-- ── splits ─────────────────────────────────────────────
opt.splitright = true          -- vertical splits open to the right
opt.splitbelow = true          -- horizontal splits open below

-- ── Misc ───────────────────────────────────────────────
opt.mouse = "a"                -- enable mouse support (useful in bed!)
opt.clipboard = "unnamedplus"  -- use system clipboard so copy/paste works with the OS
opt.undofile = true            -- persistent undo history, even after closing the file
opt.updatetime = 250           -- faster cursor hold events (used by gitsigns)
opt.timeoutlen = 300           -- how long to wait for a key sequence (e.g. jk to escape)
