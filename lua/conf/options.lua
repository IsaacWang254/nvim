local options = {
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" } ,
  fileencoding = "utf-8",
  ignorecase = true,
  -- Floor for searching if fff's binary ever fails to load: :grep still
  -- works, and lands results in the quickfix list.
  grepprg = "rg --vimgrep --smart-case",
  grepformat = "%f:%l:%c:%m",
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
  number = true,
  relativenumber = true,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 4,
  sidescrolloff = 4,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Create an autocommand group for file-specific settings
vim.api.nvim_create_augroup("FileTypeSpecific", { clear = true })

-- Set shiftwidth and tabstop to 2 for HTML, CSS, JavaScript, and Lua files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "javascript", "lua" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
    group = "FileTypeSpecific",
})

-- Stop Neovim continuing comment leaders onto the next line. Was two
-- overlapping `:autocmd` strings outside any group, so re-sourcing this file
-- stacked duplicates every time.
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.opt.shortmess:append "c"
