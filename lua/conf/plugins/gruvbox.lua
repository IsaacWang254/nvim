-- Gruvbox, dark with hard contrast, matching the terminal's Gruvbox Dark Hard.
--
-- lazy = false + priority = 1000 so the colorscheme is available during
-- startup (it's applied here in config, replacing the old local slate
-- default). slate/chalk in colors/ remain available via :colorscheme.
return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({ contrast = "hard" })
    vim.o.background = "dark"
    vim.cmd.colorscheme("gruvbox")
  end,
}
