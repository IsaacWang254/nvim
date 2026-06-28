-- Slate, adapted from Ghostex's bundled dark theme.
vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "slate"
vim.o.background = "dark"
vim.o.termguicolors = true

local c = {
  bg = "#121314",
  bg_alt = "#191A1B",
  bg_panel = "#202122",
  bg_hover = "#242526",
  bg_input = "#191A1B",
  bg_selection = "#276782",
  bg_selection_inactive = "#1f3c4b",
  bg_match = "#24576d",
  bg_match_alt = "#224d60",
  fg = "#BBBEBF",
  fg_ui = "#bfbfbf",
  fg_bright = "#ededed",
  fg_dim = "#8C8C8C",
  fg_muted = "#858889",
  fg_disabled = "#555555",
  border = "#2A2B2C",
  border_input = "#333536",
  accent = "#3994BC",
  accent_link = "#48A0C7",
  accent_dark = "#297AA0",
  blue = "#79c0ff",
  cyan = "#3a94bc",
  green = "#7ee787",
  green_diff = "#73c991",
  yellow = "#e5ba7d",
  orange = "#ffa657",
  purple = "#d2a8ff",
  red = "#ff7b72",
  red_soft = "#f48771",
  red_dim = "#ffa198",
  white = "#FFFFFF",
  black = "#0d1117",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg_ui, bg = c.bg_panel })
hl("FloatBorder", { fg = c.border, bg = c.bg_panel })
hl("FloatTitle", { fg = c.fg_ui, bg = c.bg_panel, bold = true })
hl("ColorColumn", { bg = c.bg_hover })
hl("Conceal", { fg = c.fg_dim })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorColumn", { bg = c.bg_hover })
hl("CursorLine", { bg = c.bg_hover })
hl("CursorLineNr", { fg = c.fg, bold = true })
hl("LineNr", { fg = c.fg_muted })
hl("SignColumn", { fg = c.fg_muted, bg = c.bg })
hl("Folded", { fg = c.fg_dim, bg = c.bg_hover })
hl("FoldColumn", { fg = c.fg_dim, bg = c.bg })
hl("MatchParen", { fg = c.fg_ui, bg = "#244654", bold = true })
hl("NonText", { fg = c.fg_disabled })
hl("SpecialKey", { fg = c.fg_dim })
hl("Whitespace", { fg = "#4b4f51" })
hl("Visual", { bg = c.bg_selection })
hl("VisualNOS", { bg = c.bg_selection_inactive })
hl("Search", { fg = c.fg_bright, bg = c.bg_match })
hl("IncSearch", { fg = c.white, bg = c.accent_dark })
hl("CurSearch", { fg = c.white, bg = c.accent_dark })
hl("Substitute", { fg = c.white, bg = c.accent_dark })
hl("Directory", { fg = c.blue })
hl("EndOfBuffer", { fg = c.bg })

hl("StatusLine", { fg = c.fg_dim, bg = c.bg_alt })
hl("StatusLineNC", { fg = c.fg_disabled, bg = c.bg_alt })
hl("WinBar", { fg = c.fg_ui, bg = c.bg })
hl("WinBarNC", { fg = c.fg_dim, bg = c.bg })
hl("WinSeparator", { fg = c.border })
hl("VertSplit", { fg = c.border })
hl("TabLine", { fg = c.fg_dim, bg = c.bg_alt })
hl("TabLineFill", { fg = c.fg_dim, bg = c.bg_alt })
hl("TabLineSel", { fg = c.fg_ui, bg = c.bg })
hl("Title", { fg = c.blue, bold = true })

hl("Pmenu", { fg = c.fg_ui, bg = c.bg_panel })
hl("PmenuSel", { fg = c.fg_bright, bg = "#1b2f38" })
hl("PmenuSbar", { bg = c.bg_hover })
hl("PmenuThumb", { bg = "#626466" })
hl("WildMenu", { fg = c.white, bg = c.accent_dark })
hl("Question", { fg = c.green })
hl("MoreMsg", { fg = c.green })
hl("ModeMsg", { fg = c.fg_ui })
hl("MsgArea", { fg = c.fg_ui, bg = c.bg })
hl("MsgSeparator", { fg = c.border, bg = c.bg_alt })
hl("ErrorMsg", { fg = c.red_dim })
hl("WarningMsg", { fg = c.yellow })

hl("Comment", { fg = "#8b949e", italic = true })
hl("Constant", { fg = c.blue })
hl("String", { fg = "#a5d6ff" })
hl("Character", { fg = c.red })
hl("Number", { fg = c.blue })
hl("Boolean", { fg = c.blue })
hl("Float", { fg = c.blue })
hl("Identifier", { fg = c.orange })
hl("Function", { fg = c.purple })
hl("Statement", { fg = c.red })
hl("Conditional", { fg = c.red })
hl("Repeat", { fg = c.red })
hl("Label", { fg = c.fg_ui })
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
hl("Delimiter", { fg = c.fg })
hl("SpecialComment", { fg = "#8b949e", italic = true })
hl("Debug", { fg = c.purple })
hl("Underlined", { fg = "#a5d6ff", underline = true })
hl("Ignore", { fg = c.fg_disabled })
hl("Error", { fg = c.red_dim, italic = true })
hl("Todo", { fg = c.black, bg = c.blue, bold = true })

hl("DiagnosticError", { fg = c.red_soft })
hl("DiagnosticWarn", { fg = c.yellow })
hl("DiagnosticInfo", { fg = c.cyan })
hl("DiagnosticHint", { fg = c.accent })
hl("DiagnosticOk", { fg = c.green })
hl("DiagnosticUnderlineError", { sp = c.red_soft, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.yellow, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.cyan, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.accent, undercurl = true })
hl("DiagnosticVirtualTextError", { fg = c.red_soft, bg = "#3A1D1D" })
hl("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = "#352A05" })
hl("DiagnosticVirtualTextInfo", { fg = c.cyan, bg = "#1E3A47" })
hl("DiagnosticVirtualTextHint", { fg = c.accent, bg = "#1E3A47" })
hl("LspReferenceText", { bg = "#1d3540" })
hl("LspReferenceRead", { bg = "#1d3540" })
hl("LspReferenceWrite", { bg = "#224d60" })
hl("LspSignatureActiveParameter", { fg = c.fg_bright, bg = "#1b2f38" })

hl("DiffAdd", { fg = c.green, bg = "#04260f" })
hl("DiffChange", { fg = c.orange, bg = "#5a1e02" })
hl("DiffDelete", { fg = c.red_dim, bg = "#490202" })
hl("DiffText", { fg = c.fg_bright, bg = "#2e5934" })
hl("Added", { fg = c.green_diff })
hl("Changed", { fg = c.yellow })
hl("Removed", { fg = c.red_soft })

hl("GitSignsAdd", { fg = c.green_diff, bg = c.bg })
hl("GitSignsChange", { fg = c.yellow, bg = c.bg })
hl("GitSignsDelete", { fg = c.red_soft, bg = c.bg })

hl("SpellBad", { sp = c.red_soft, undercurl = true })
hl("SpellCap", { sp = c.cyan, undercurl = true })
hl("SpellLocal", { sp = c.green, undercurl = true })
hl("SpellRare", { sp = c.purple, undercurl = true })

hl("TreesitterContext", { bg = c.bg })
hl("TreesitterContextLineNumber", { fg = c.fg_muted, bg = c.bg })

hl("@comment", { fg = "#8b949e", italic = true })
hl("@constant", { fg = c.blue })
hl("@constant.builtin", { fg = c.blue })
hl("@constant.macro", { fg = c.blue })
hl("@string", { fg = "#a5d6ff" })
hl("@string.escape", { fg = c.green, bold = true })
hl("@string.regexp", { fg = "#a5d6ff" })
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
hl("@parameter", { fg = "#c9d1d9" })
hl("@variable", { fg = "#c9d1d9" })
hl("@variable.builtin", { fg = c.blue })
hl("@variable.parameter", { fg = "#c9d1d9" })
hl("@variable.member", { fg = c.blue })
hl("@property", { fg = c.blue })
hl("@field", { fg = c.blue })
hl("@keyword", { fg = c.red })
hl("@keyword.function", { fg = c.red })
hl("@keyword.operator", { fg = c.red })
hl("@keyword.return", { fg = c.red })
hl("@operator", { fg = c.red })
hl("@punctuation", { fg = c.fg })
hl("@punctuation.bracket", { fg = c.fg })
hl("@punctuation.delimiter", { fg = c.fg })
hl("@type", { fg = c.green })
hl("@type.builtin", { fg = c.green })
hl("@type.definition", { fg = c.green })
hl("@module", { fg = c.blue })
hl("@namespace", { fg = c.blue })
hl("@label", { fg = c.fg_ui })
hl("@tag", { fg = c.green })
hl("@tag.attribute", { fg = c.blue })
hl("@tag.delimiter", { fg = c.fg })
hl("@markup.heading", { fg = c.blue, bold = true })
hl("@markup.strong", { fg = "#c9d1d9", bold = true })
hl("@markup.italic", { fg = "#c9d1d9", italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.quote", { fg = c.green })
hl("@markup.raw", { fg = c.blue })
hl("@markup.link", { fg = "#a5d6ff", underline = true })
hl("@markup.list", { fg = c.orange })
hl("@diff.plus", { fg = c.green })
hl("@diff.minus", { fg = c.red_dim })
hl("@diff.delta", { fg = c.orange })

hl("@lsp.type.namespace", { fg = c.blue })
hl("@lsp.type.type", { fg = c.green })
hl("@lsp.type.class", { fg = c.green })
hl("@lsp.type.enum", { fg = c.green })
hl("@lsp.type.interface", { fg = c.green })
hl("@lsp.type.struct", { fg = c.green })
hl("@lsp.type.parameter", { fg = "#c9d1d9" })
hl("@lsp.type.variable", { fg = "#c9d1d9" })
hl("@lsp.type.property", { fg = c.blue })
hl("@lsp.type.enumMember", { fg = c.blue })
hl("@lsp.type.function", { fg = c.purple })
hl("@lsp.type.method", { fg = c.purple })
hl("@lsp.type.macro", { fg = c.blue, italic = true })
hl("@lsp.type.keyword", { fg = c.red })
hl("@lsp.type.comment", { fg = "#8b949e", italic = true })
hl("@lsp.type.string", { fg = "#a5d6ff" })
hl("@lsp.type.number", { fg = c.blue })
hl("@lsp.typemod.variable.readonly", { fg = c.blue })
hl("@lsp.typemod.property.readonly", { fg = c.blue })

hl("CmpItemAbbr", { fg = c.fg_ui })
hl("CmpItemAbbrDeprecated", { fg = c.fg_disabled, strikethrough = true })
hl("CmpItemAbbrMatch", { fg = c.fg_ui, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = c.fg_ui, bold = true })
hl("CmpItemKind", { fg = c.blue })
hl("CmpItemMenu", { fg = c.fg_dim })

hl("TelescopeNormal", { fg = c.fg_ui, bg = c.bg_panel })
hl("TelescopeBorder", { fg = c.border, bg = c.bg_panel })
hl("TelescopePromptNormal", { fg = c.fg_ui, bg = c.bg_input })
hl("TelescopePromptBorder", { fg = c.border_input, bg = c.bg_input })
hl("TelescopePromptTitle", { fg = c.white, bg = c.accent_dark, bold = true })
hl("TelescopePreviewTitle", { fg = c.white, bg = c.accent_dark, bold = true })
hl("TelescopeResultsTitle", { fg = c.fg_ui, bg = c.bg_panel, bold = true })
hl("TelescopeSelection", { fg = c.fg_bright, bg = "#1b2f38" })
hl("TelescopeMatching", { fg = c.fg_bright, bold = true })

hl("NvimTreeNormal", { fg = c.fg_ui, bg = c.bg_alt })
hl("NvimTreeNormalNC", { fg = c.fg_ui, bg = c.bg_alt })
hl("NvimTreeRootFolder", { fg = c.fg_ui, bold = true })
hl("NvimTreeFolderName", { fg = c.blue })
hl("NvimTreeOpenedFolderName", { fg = c.blue, bold = true })
hl("NvimTreeFileIcon", { fg = c.fg_dim })
hl("NvimTreeIndentMarker", { fg = c.border })
hl("NvimTreeGitNew", { fg = c.green_diff })
hl("NvimTreeGitDirty", { fg = c.yellow })
hl("NvimTreeGitDeleted", { fg = c.red_soft })
hl("NvimTreeSpecialFile", { fg = c.purple, underline = true })
hl("NvimTreeImageFile", { fg = c.fg_dim })
hl("NvimTreeExecFile", { fg = c.green })

hl("LazyNormal", { fg = c.fg_ui, bg = c.bg_panel })
hl("LazyButton", { fg = c.fg_ui, bg = c.bg_hover })
hl("LazyButtonActive", { fg = c.white, bg = c.accent_dark, bold = true })
hl("LazyH1", { fg = c.white, bg = c.accent_dark, bold = true })
hl("LazyH2", { fg = c.blue, bold = true })
hl("LazySpecial", { fg = c.blue })
hl("LazyReasonPlugin", { fg = c.purple })
hl("LazyCommit", { fg = c.green })

vim.g.terminal_color_0 = c.bg
vim.g.terminal_color_1 = c.red_soft
vim.g.terminal_color_2 = c.green_diff
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.purple
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.fg
vim.g.terminal_color_8 = c.fg_dim
vim.g.terminal_color_9 = c.red
vim.g.terminal_color_10 = c.green
vim.g.terminal_color_11 = c.orange
vim.g.terminal_color_12 = c.accent_link
vim.g.terminal_color_13 = c.purple
vim.g.terminal_color_14 = c.accent
vim.g.terminal_color_15 = c.white
