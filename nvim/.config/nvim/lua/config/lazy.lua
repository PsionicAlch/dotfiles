-- ── Bootstrap lazy.nvim ────────────────────────────────
-- This block checks if lazy.nvim is installed, and if not,
-- downloads it automatically. You never need to manually install it.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ── Load plugins ───────────────────────────────────────
-- This tells lazy.nvim to look in lua/config/plugins/ for plugin specs
-- Each file in that folder defines one or more plugins
require("lazy").setup("config.plugins", {
  change_detection = {
    notify = false, -- don't notify every time you save a config file
  },
})
