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
      ts.install(ensure_installed)
    end, {
      desc = "Install configured Tree-sitter parsers",
    })

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
