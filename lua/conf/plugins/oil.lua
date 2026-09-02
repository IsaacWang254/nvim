-- oil.nvim: browse and edit a directory as if it were a text buffer.
--
-- The other half of fff. fff answers "where is the file I want"; oil answers
-- "make a file here, rename this, delete that" -- the things a fuzzy picker
-- has no verb for. Deliberately not a sidebar tree: there is nothing new to
-- memorise, because editing the directory *is* editing a buffer. `o` and a
-- name creates a file, `dd` deletes, changing the text renames, and none of
-- it touches disk until `:w`.
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  -- Upstream advises against lazy-loading this one. With
  -- `default_file_explorer` on, oil replaces netrw, and that hijack has to be
  -- in place before the first directory is opened -- otherwise `nvim .` races
  -- it and lands in netrw.
  lazy = false,

  opts = {
    -- Take over netrw, so `:Explore` and `nvim <dir>` land in oil too.
    default_file_explorer = true,
    -- `:w` on a rename or delete asks first; worth keeping, given that a
    -- stray `dd` in a directory buffer is a deleted file.
    prompt_save_on_select_new_entry = true,
    view_options = {
      -- Dotfiles are the point, on this machine especially.
      show_hidden = true,
    },
  },

  keys = {
    -- Oil's own documented binding: `-` goes up into the current file's
    -- directory, and `-` again goes up another level. `<CR>` opens, and `g?`
    -- lists every other key from inside oil, so nothing here needs recalling
    -- cold.
    { "-", "<CMD>Oil<CR>", desc = "oil: open parent directory" },
  },
}
