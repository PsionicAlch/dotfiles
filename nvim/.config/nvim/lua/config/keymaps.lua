-- shorthand — instead of vim.keymap.set every time
local map = vim.keymap.set

-- ── Leader key ─────────────────────────────────────────
-- The leader key is a prefix for your custom shortcuts
-- Space is the most popular choice — easy to hit with your thumb
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ── Escape ─────────────────────────────────────────────
-- jk in insert mode = Escape, so your hands never leave home row
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- ── Window navigation ──────────────────────────────────
-- Ctrl + hjkl to move between splits without pressing Ctrl+W first
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- ── File tree ──────────────────────────────────────────
-- Space + e toggles the floating file tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- ── Lazygit ────────────────────────────────────────────
-- Space + g opens lazygit in a floating window
map("n", "<leader>g", ":LazyGit<CR>", { desc = "Open lazygit" })

-- ── Buffer navigation ──────────────────────────────────
-- Think of buffers like open tabs — these let you cycle through them
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprev<CR>", { desc = "Previous buffer" })
map("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer" })

-- ── Better up/down ─────────────────────────────────────
-- Makes j and k move by visual line, not actual line
-- (matters when a long line wraps visually)
map("n", "j", "gj", { desc = "Move down visual line" })
map("n", "k", "gk", { desc = "Move up visual line" })

-- ── Indenting in visual mode ───────────────────────────
-- Normally after indenting with > or < you lose your selection
-- This keeps it selected so you can indent multiple times
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- ── Move lines up/down ─────────────────────────────────
-- Alt + j/k moves the current line (or selected lines) up or down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- ── Search ─────────────────────────────────────────────
-- Clear search highlighting with Escape in normal mode
map("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlights" })

-- ── Saving ─────────────────────────────────────────────
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Save and quit" })
