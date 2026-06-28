-- Chalk, adapted from Ghostex's bundled light theme.
vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "chalk"
vim.o.background = "light"
vim.o.termguicolors = true

local c = {
  bg = "#FFFFFF",
  bg_alt = "#FAFAFD",
  bg_panel = "#FAFAFD",
  bg_hover = "#EAEAEA",
  bg_input = "#FFFFFF",
  bg_selection = "#bfd9f3",
  bg_selection_inactive = "#e5f0fa",
  bg_match = "#bfd9f3",
  fg = "#202020",
  fg_token = "#1f2328",
  fg_dim = "#606060",
  fg_muted = "#999999",
  fg_disabled = "#BBBBBB",
  border = "#F0F1F2",
  border_strong = "#D8D8D8",
  accent = "#0069CC",
  blue = "#0550ae",
  string = "#0a3069",
  green = "#116329",
  green_diff = "#587c0c",
  yellow = "#667309",
  orange = "#953800",
  purple = "#8250df",
  red = "#cf222e",
  red_dark = "#82071e",
  red_ui = "#ad0707",
  white = "#FFFFFF",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg_panel })
hl("FloatBorder", { fg = "#E4E5E6", bg = c.bg_panel })
hl("FloatTitle", { fg = c.fg, bg = c.bg_panel, bold = true })
hl("ColorColumn", { bg = c.bg_hover })
hl("Conceal", { fg = c.fg_dim })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorColumn", { bg = "#F5F5F5" })
hl("CursorLine", { bg = "#F7F7F7" })
hl("CursorLineNr", { fg = c.fg, bold = true })
hl("LineNr", { fg = c.fg_dim })
hl("SignColumn", { fg = c.fg_dim, bg = c.bg })
hl("Folded", { fg = c.fg_dim, bg = c.bg_hover })
hl("FoldColumn", { fg = c.fg_dim, bg = c.bg })
hl("MatchParen", { fg = c.fg, bg = "#bfd9f3", bold = true })
hl("NonText", { fg = c.fg_disabled })
hl("SpecialKey", { fg = c.fg_dim })
hl("Whitespace", { fg = "#D9D9D9" })
hl("Visual", { bg = c.bg_selection })
hl("VisualNOS", { bg = c.bg_selection_inactive })
hl("Search", { fg = c.fg, bg = c.bg_match })
hl("IncSearch", { fg = c.white, bg = c.accent })
hl("CurSearch", { fg = c.white, bg = c.accent })
hl("Substitute", { fg = c.white, bg = c.accent })
hl("Directory", { fg = c.blue })
hl("EndOfBuffer", { fg = c.bg })

hl("StatusLine", { fg = c.fg_dim, bg = c.bg_alt })
hl("StatusLineNC", { fg = c.fg_disabled, bg = c.bg_alt })
hl("WinBar", { fg = c.fg, bg = c.bg })
hl("WinBarNC", { fg = c.fg_dim, bg = c.bg })
hl("WinSeparator", { fg = c.border })
hl("VertSplit", { fg = c.border })
hl("TabLine", { fg = c.fg_dim, bg = c.bg_alt })
hl("TabLineFill", { fg = c.fg_dim, bg = c.bg_alt })
hl("TabLineSel", { fg = c.fg, bg = c.bg })
hl("Title", { fg = c.blue, bold = true })

hl("Pmenu", { fg = c.fg, bg = c.bg_panel })
hl("PmenuSel", { fg = c.fg, bg = "#dcecff" })
hl("PmenuSbar", { bg = c.bg_hover })
hl("PmenuThumb", { bg = "#C8C8C8" })
hl("WildMenu", { fg = c.white, bg = c.accent })
hl("Question", { fg = c.green })
hl("MoreMsg", { fg = c.green })
hl("ModeMsg", { fg = c.fg })
hl("MsgArea", { fg = c.fg, bg = c.bg })
hl("MsgSeparator", { fg = c.border, bg = c.bg_alt })
hl("ErrorMsg", { fg = c.red_dark })
hl("WarningMsg", { fg = c.yellow })

hl("Comment", { fg = "#6e7781", italic = true })
hl("Constant", { fg = c.blue })
hl("String", { fg = c.string })
hl("Character", { fg = c.red })
hl("Number", { fg = c.blue })
hl("Boolean", { fg = c.blue })
hl("Float", { fg = c.blue })
hl("Identifier", { fg = c.orange })
hl("Function", { fg = c.purple })
hl("Statement", { fg = c.red })
hl("Conditional", { fg = c.red })
hl("Repeat", { fg = c.red })
hl("Label", { fg = c.fg_token })
hl("Operator", { fg = c.red })
hl("Keyword", { fg = c.red })
hl("Exception", { fg = c.red })
hl("PreProc", { fg = c.red })
hl("Include", { fg = c.red })
hl("Define", { fg = c.red })
hl("Macro", { fg = c.blue })
hl("PreCondit", { fg = c.red })
hl("Type", { fg = c.green })
hl("StorageClass", { fg = c.red })
hl("Structure", { fg = c.green })
hl("Typedef", { fg = c.green })
hl("Special", { fg = c.blue })
hl("SpecialChar", { fg = c.red })
hl("Tag", { fg = c.green })
hl("Delimiter", { fg = c.fg_token })
hl("SpecialComment", { fg = "#6e7781", italic = true })
hl("Debug", { fg = c.purple })
hl("Underlined", { fg = c.string, underline = true })
hl("Ignore", { fg = c.fg_disabled })
hl("Error", { fg = c.red_dark, italic = true })
hl("Todo", { fg = c.white, bg = c.blue, bold = true })

hl("DiagnosticError", { fg = c.red_ui })
hl("DiagnosticWarn", { fg = c.yellow })
hl("DiagnosticInfo", { fg = c.accent })
hl("DiagnosticHint", { fg = c.blue })
hl("DiagnosticOk", { fg = c.green })
hl("DiagnosticUnderlineError", { sp = c.red_ui, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.yellow, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.accent, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.blue, undercurl = true })
hl("DiagnosticVirtualTextError", { fg = c.red_ui, bg = "#FDEDED" })
hl("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = "#FDF6E3" })
hl("DiagnosticVirtualTextInfo", { fg = c.accent, bg = "#E6F2FA" })
hl("DiagnosticVirtualTextHint", { fg = c.blue, bg = "#E6F2FA" })
hl("LspReferenceText", { bg = "#e5f0fa" })
hl("LspReferenceRead", { bg = "#e5f0fa" })
hl("LspReferenceWrite", { bg = "#dcecff" })
hl("LspSignatureActiveParameter", { fg = c.fg, bg = "#dcecff" })

hl("DiffAdd", { fg = c.green, bg = "#dafbe1" })
hl("DiffChange", { fg = c.orange, bg = "#ffd8b5" })
hl("DiffDelete", { fg = c.red_dark, bg = "#ffebe9" })
hl("DiffText", { fg = c.fg, bg = "#c4edce" })
hl("Added", { fg = c.green_diff })
hl("Changed", { fg = c.yellow })
hl("Removed", { fg = c.red_ui })

hl("GitSignsAdd", { fg = c.green_diff, bg = c.bg })
hl("GitSignsChange", { fg = c.yellow, bg = c.bg })
hl("GitSignsDelete", { fg = c.red_ui, bg = c.bg })

hl("SpellBad", { sp = c.red_ui, undercurl = true })
hl("SpellCap", { sp = c.accent, undercurl = true })
hl("SpellLocal", { sp = c.green, undercurl = true })
hl("SpellRare", { sp = c.purple, undercurl = true })

hl("TreesitterContext", { bg = c.bg })
hl("TreesitterContextLineNumber", { fg = c.fg_dim, bg = c.bg })

hl("@comment", { fg = "#6e7781", italic = true })
hl("@constant", { fg = c.blue })
hl("@constant.builtin", { fg = c.blue })
hl("@constant.macro", { fg = c.blue })
hl("@string", { fg = c.string })
hl("@string.escape", { fg = c.green, bold = true })
hl("@string.regexp", { fg = c.string })
hl("@character", { fg = c.red })
hl("@number", { fg = c.blue })
hl("@boolean", { fg = c.blue })
hl("@float", { fg = c.blue })
hl("@function", { fg = c.purple })
hl("@function.call", { fg = c.purple })
hl("@function.builtin", { fg = c.blue })
hl("@function.macro", { fg = c.blue, italic = true })
hl("@method", { fg = c.purple })
hl("@method.call", { fg = c.purple })
hl("@constructor", { fg = c.green })
hl("@parameter", { fg = c.fg_token })
hl("@variable", { fg = c.fg_token })
hl("@variable.builtin", { fg = c.blue })
hl("@variable.parameter", { fg = c.fg_token })
hl("@variable.member", { fg = c.blue })
hl("@property", { fg = c.blue })
hl("@field", { fg = c.blue })
hl("@keyword", { fg = c.red })
hl("@keyword.function", { fg = c.red })
hl("@keyword.operator", { fg = c.red })
hl("@keyword.return", { fg = c.red })
hl("@operator", { fg = c.red })
hl("@punctuation", { fg = c.fg_token })
hl("@punctuation.bracket", { fg = c.fg_token })
hl("@punctuation.delimiter", { fg = c.fg_token })
hl("@type", { fg = c.green })
hl("@type.builtin", { fg = c.green })
hl("@type.definition", { fg = c.green })
hl("@module", { fg = c.blue })
hl("@namespace", { fg = c.blue })
hl("@label", { fg = c.fg_token })
hl("@tag", { fg = c.green })
hl("@tag.attribute", { fg = c.blue })
hl("@tag.delimiter", { fg = c.fg_token })
hl("@markup.heading", { fg = c.blue, bold = true })
hl("@markup.strong", { fg = c.fg_token, bold = true })
hl("@markup.italic", { fg = c.fg_token, italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.quote", { fg = c.green })
hl("@markup.raw", { fg = c.blue })
hl("@markup.link", { fg = c.string, underline = true })
hl("@markup.list", { fg = c.orange })
hl("@diff.plus", { fg = c.green })
hl("@diff.minus", { fg = c.red_dark })
hl("@diff.delta", { fg = c.orange })

hl("@lsp.type.namespace", { fg = c.blue })
hl("@lsp.type.type", { fg = c.green })
hl("@lsp.type.class", { fg = c.green })
hl("@lsp.type.enum", { fg = c.green })
hl("@lsp.type.interface", { fg = c.green })
hl("@lsp.type.struct", { fg = c.green })
hl("@lsp.type.parameter", { fg = c.fg_token })
hl("@lsp.type.variable", { fg = c.fg_token })
hl("@lsp.type.property", { fg = c.blue })
hl("@lsp.type.enumMember", { fg = c.blue })
hl("@lsp.type.function", { fg = c.purple })
hl("@lsp.type.method", { fg = c.purple })
hl("@lsp.type.macro", { fg = c.blue, italic = true })
hl("@lsp.type.keyword", { fg = c.red })
hl("@lsp.type.comment", { fg = "#6e7781", italic = true })
hl("@lsp.type.string", { fg = c.string })
hl("@lsp.type.number", { fg = c.blue })
hl("@lsp.typemod.variable.readonly", { fg = c.blue })
hl("@lsp.typemod.property.readonly", { fg = c.blue })

hl("CmpItemAbbr", { fg = c.fg })
hl("CmpItemAbbrDeprecated", { fg = c.fg_disabled, strikethrough = true })
hl("CmpItemAbbrMatch", { fg = c.accent, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = c.accent, bold = true })
hl("CmpItemKind", { fg = c.blue })
hl("CmpItemMenu", { fg = c.fg_dim })

hl("TelescopeNormal", { fg = c.fg, bg = c.bg_panel })
hl("TelescopeBorder", { fg = "#E4E5E6", bg = c.bg_panel })
hl("TelescopePromptNormal", { fg = c.fg, bg = c.bg_input })
hl("TelescopePromptBorder", { fg = c.border_strong, bg = c.bg_input })
hl("TelescopePromptTitle", { fg = c.white, bg = c.accent, bold = true })
hl("TelescopePreviewTitle", { fg = c.white, bg = c.accent, bold = true })
hl("TelescopeResultsTitle", { fg = c.fg, bg = c.bg_panel, bold = true })
hl("TelescopeSelection", { fg = c.fg, bg = "#dcecff" })
hl("TelescopeMatching", { fg = c.accent, bold = true })

hl("NvimTreeNormal", { fg = c.fg, bg = c.bg_alt })
hl("NvimTreeNormalNC", { fg = c.fg, bg = c.bg_alt })
hl("NvimTreeRootFolder", { fg = c.fg, bold = true })
hl("NvimTreeFolderName", { fg = c.blue })
hl("NvimTreeOpenedFolderName", { fg = c.blue, bold = true })
hl("NvimTreeFileIcon", { fg = c.fg_dim })
hl("NvimTreeIndentMarker", { fg = c.border_strong })
hl("NvimTreeGitNew", { fg = c.green_diff })
hl("NvimTreeGitDirty", { fg = c.yellow })
hl("NvimTreeGitDeleted", { fg = c.red_ui })
hl("NvimTreeSpecialFile", { fg = c.purple, underline = true })
hl("NvimTreeImageFile", { fg = c.fg_dim })
hl("NvimTreeExecFile", { fg = c.green })

hl("LazyNormal", { fg = c.fg, bg = c.bg_panel })
hl("LazyButton", { fg = c.fg, bg = c.bg_hover })
hl("LazyButtonActive", { fg = c.white, bg = c.accent, bold = true })
hl("LazyH1", { fg = c.white, bg = c.accent, bold = true })
hl("LazyH2", { fg = c.blue, bold = true })
hl("LazySpecial", { fg = c.blue })
hl("LazyReasonPlugin", { fg = c.purple })
hl("LazyCommit", { fg = c.green })

vim.g.terminal_color_0 = "#24292f"
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.purple
vim.g.terminal_color_6 = c.accent
vim.g.terminal_color_7 = c.fg
vim.g.terminal_color_8 = "#57606a"
vim.g.terminal_color_9 = c.red_ui
vim.g.terminal_color_10 = c.green_diff
vim.g.terminal_color_11 = "#B69500"
vim.g.terminal_color_12 = c.accent
vim.g.terminal_color_13 = c.purple
vim.g.terminal_color_14 = "#3399E6"
vim.g.terminal_color_15 = c.white
