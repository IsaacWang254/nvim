require "conf.options"
require "conf.keymap"
require "conf.escape"
require "conf.lazy_init"

-- Vercel light/dark (colors/vercel.lua). It follows 'background', which
-- Neovim keeps in sync with the terminal, so it tracks the macOS appearance.
vim.cmd.colorscheme("vercel")
