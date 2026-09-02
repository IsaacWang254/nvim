-- Filetype icons.
--
-- Was a dependency of nvim-tree; kept as a plugin in its own right because fff
-- uses it for the icons in its picker. `fff/file_picker/icons.lua` probes for
-- `nvim-web-devicons` then `mini.icons` and silently renders without icons if
-- neither is present, so dropping this degrades the picker quietly rather than
-- loudly. Lazy: lazy.nvim loads it when fff requires it.
return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
}
