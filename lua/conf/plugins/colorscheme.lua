-- Catppuccin Mocha.
--
-- Dark only, matching the rest of the setup: Ghostty is pinned to Mocha (see
-- the dotfiles repo), so there is no light terminal background for a light
-- variant to sit on.
--
-- This replaced two hand-written colorschemes, `slate` and `chalk`, adapted
-- from Ghostex. They covered the highlight groups they were written against;
-- the plugin also tracks treesitter, LSP semantic tokens and diagnostics as
-- those group names change upstream, which is the part that rots by hand.
--
-- priority 1000 + lazy = false: the colorscheme has to be applied before any
-- other plugin draws, so it cannot be lazy-loaded.
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    background = { dark = "mocha" },
    term_colors = true,
    integrations = {
      treesitter = true,
      native_lsp = { enabled = true },
      -- oil and fff are the two pickers/explorers in this config; both read
      -- standard groups, so no per-plugin integration flag is needed.
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
