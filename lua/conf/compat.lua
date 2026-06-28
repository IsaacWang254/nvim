-- Compatibility shims for API changes across Neovim versions.
--
-- Neovim 0.11 removed `vim.treesitter.language.ft_to_lang` in favor of
-- `vim.treesitter.language.get_lang`. Some plugins (e.g. older telescope.nvim)
-- still call `ft_to_lang`, which causes runtime errors during preview highlighting.

local lang = vim.treesitter and vim.treesitter.language
if lang and lang.ft_to_lang == nil and type(lang.get_lang) == "function" then
  lang.ft_to_lang = lang.get_lang
end

