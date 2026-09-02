-- fff: Rust-core fuzzy file picker with frecency ranking.
--
-- Chosen over telescope for large monorepos. Telescope re-spawns fd to list
-- the tree and ripgrep on each debounced keystroke; fff keeps a warm in-memory
-- index, so repeat queries do not pay that cost again. Frecency matters more
-- the bigger the repo -- you touch a few dozen files out of hundreds of
-- thousands, and telescope has no notion of that.
--
-- If the binary is missing (a fresh machine, or a proxy that blocks the
-- release download), these keys report it rather than throwing a stack trace,
-- and `:grep` still works -- see grepprg in conf/options.lua.

local function picker(name, fallback)
  return function()
    local ok, err = pcall(function()
      require("fff")[name]()
    end)
    if not ok then
      vim.notify(
        ("fff.%s failed: %s\n\nRun :FFFHealth to diagnose.\nFallback: %s"):format(name, err, fallback),
        vim.log.levels.ERROR
      )
    end
  end
end

return {
  "dmtrKovalenko/fff",
  -- Package was renamed from `fff.nvim`; `:Lazy clean` if the old one lingers.
  build = function()
    -- Downloads a prebuilt binary, falling back to `cargo build`.
    require("fff.download").download_or_build_binary()
  end,

  -- Not lazy on purpose: it self-initialises, and building the index at
  -- startup is what makes the first query in a big repo fast.
  lazy = false,

  opts = {
    prompt = "> ",
    max_results = 100,
    -- Indexing $HOME is on by default and is a lot of files for no benefit
    -- here; every repo worth searching has a root well below it.
    enable_home_dir_scanning = false,
  },

  keys = {
    { "<leader>ff", picker("find_files", ":find <pattern>"), desc = "fff: find files" },
    { "<leader>fr", picker("live_grep", ":grep <pattern>"), desc = "fff: live grep" },
    {
      "<leader>fz",
      function()
        local ok = pcall(function()
          require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
        end)
        if not ok then
          vim.notify("fff.live_grep failed. Run :FFFHealth.", vim.log.levels.ERROR)
        end
      end,
      desc = "fff: fuzzy live grep",
    },
    {
      "<leader>fw",
      picker("live_grep_under_cursor", ":grep <cword>"),
      mode = { "n", "x" },
      desc = "fff: grep word / selection",
    },
  },
}
