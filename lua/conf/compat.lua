-- Compatibility shims for API changes across Neovim versions.
--
-- Neovim 0.11 removed `vim.treesitter.language.ft_to_lang` in favor of
-- `vim.treesitter.language.get_lang`. Plugins that still call `ft_to_lang`
-- error at runtime during preview highlighting.
--
-- Added for telescope, which is no longer installed. Kept because it is
-- defensive rather than specific: it only aliases the function when it is
-- genuinely missing, and costs nothing if nothing needs it.

local lang = vim.treesitter and vim.treesitter.language
if lang and lang.ft_to_lang == nil and type(lang.get_lang) == "function" then
  lang.ft_to_lang = lang.get_lang
end

