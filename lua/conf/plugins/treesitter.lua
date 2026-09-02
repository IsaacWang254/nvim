return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ensure_installed = {
      "c",
      "cpp",
      "python",
      "html",
      "css",
      "javascript",
      "lua",
      "vim",
      "java",
      "go",
      "kotlin",
      "vimdoc",
      "sql",
      "vue",
      "typescript",
    }

    local ts = require("nvim-treesitter")
    ts.setup({
      -- Directory to install parsers and queries to
      -- (matches upstream default; keep explicit so it's obvious)
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    vim.api.nvim_create_user_command("TSInstallConfigured", function()
      ts.install(ensure_installed, { summary = true })
    end, {
      desc = "Install every configured Tree-sitter parser",
    })

    -- `build = ":TSUpdate"` only updates parsers that already exist, and
    -- ensure_installed is just a list -- nothing acts on it. Without this, a
    -- fresh clone has zero parsers and no highlighting until someone remembers
    -- to run :TSInstallConfigured. Install whatever is missing instead.
    --
    -- Scheduled so a cold machine compiling parsers does not block startup.
    vim.schedule(function()
      local installed = ts.get_installed("parsers")
      local missing = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, ensure_installed)
      if #missing > 0 then
        ts.install(missing, { summary = true })
      end
    end)

    -- Highlighting is handled by Neovim directly in the rewrite; enable it per-buffer.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local bufnr = args.buf
        if vim.bo[bufnr].buftype ~= "" then
          return
        end

        pcall(vim.treesitter.start, bufnr)

        if vim.tbl_contains({ "c", "cpp", "go", "javascript", "lua", "python", "typescript" }, vim.bo[bufnr].filetype) then
          vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end
}
