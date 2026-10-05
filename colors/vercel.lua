-- Vercel, light and dark, from the Geist palette. Same values as the Zed
-- Vercel theme and the Ghostty/fish/bat themes in the dotfiles repo.
--
-- Picks its palette from 'background'. Neovim sets 'background' from the
-- terminal at startup and again whenever Ghostty reports a light/dark switch,
-- and setting 'background' reloads the active colorscheme, so this follows
-- the macOS appearance with no autocmd of its own.
vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "vercel"
vim.o.termguicolors = true

local palettes = {
  dark = {
    bg = "#0a0a0a",
    bg_alt = "#000000",
    bg_panel = "#111111",
    bg_hover = "#1a1a1a",
    bg_selection = "#2e2e2e",
    bg_match = "#4d3800",
    bg_match_cur = "#ffae00",
    fg = "#ededed",
    fg_muted = "#a0a0a0",
    fg_dim = "#878787",
    fg_disabled = "#454545",
    border = "#2e2e2e",
    comment = "#a1a1a1",
    blue = "#52a8ff",
    green = "#00ac3a",
    purple = "#c472fb",
    pink = "#f12b82",
    red = "#f32e40",
    amber = "#ffae00",
    teal = "#00aa95",
    diff_add = "#0b2e17",
    diff_change = "#33260a",
    diff_delete = "#3a1015",
    diff_text = "#4d3800",
    err_bg = "#2a0d10",
    warn_bg = "#2a1f00",
    info_bg = "#0a1f33",
  },
  light = {
    bg = "#ffffff",
    bg_alt = "#fafafa",
    bg_panel = "#f2f2f2",
    bg_hover = "#f2f2f2",
    bg_selection = "#e5e5e5",
    bg_match = "#ffefcf",
    bg_match_cur = "#ffae00",
    fg = "#171717",
    fg_muted = "#666666",
    fg_dim = "#8f8f8f",
    fg_disabled = "#c9c9c9",
    border = "#ebebeb",
    comment = "#666666",
    blue = "#006bff",
    green = "#297a3a",
    purple = "#7c00c7",
    pink = "#bd2864",
    red = "#ea001d",
    amber = "#a35200",
    teal = "#067a6e",
    diff_add = "#e6f6ea",
    diff_change = "#fff4dd",
    diff_delete = "#ffe8ea",
    diff_text = "#ffe2a8",
    err_bg = "#ffeeef",
    warn_bg = "#fff4dd",
    info_bg = "#e9f2ff",
  },
}

local c = palettes[vim.o.background] or palettes.dark

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg_panel })
hl("FloatBorder", { fg = c.border, bg = c.bg_panel })
hl("FloatTitle", { fg = c.fg, bg = c.bg_panel, bold = true })
hl("ColorColumn", { bg = c.bg_hover })
hl("Conceal", { fg = c.fg_dim })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorColumn", { bg = c.bg_hover })
hl("CursorLine", { bg = c.bg_hover })
hl("CursorLineNr", { fg = c.fg, bold = true })
hl("LineNr", { fg = c.fg_dim })
hl("SignColumn", { fg = c.fg_dim, bg = c.bg })
hl("Folded", { fg = c.fg_muted, bg = c.bg_hover })
hl("FoldColumn", { fg = c.fg_dim, bg = c.bg })
hl("MatchParen", { fg = c.fg, bg = c.bg_selection, bold = true })
hl("NonText", { fg = c.fg_disabled })
hl("SpecialKey", { fg = c.fg_dim })
hl("Whitespace", { fg = c.fg_disabled })
hl("Visual", { bg = c.bg_selection })
hl("VisualNOS", { bg = c.bg_selection })
hl("Search", { fg = c.fg, bg = c.bg_match })
hl("IncSearch", { fg = "#0a0a0a", bg = c.bg_match_cur })
hl("CurSearch", { fg = "#0a0a0a", bg = c.bg_match_cur })
hl("Substitute", { fg = "#0a0a0a", bg = c.bg_match_cur })
hl("Directory", { fg = c.blue })
hl("EndOfBuffer", { fg = c.bg })

hl("StatusLine", { fg = c.fg_muted, bg = c.bg_panel })
hl("StatusLineNC", { fg = c.fg_dim, bg = c.bg_alt })
hl("WinBar", { fg = c.fg, bg = c.bg })
hl("WinBarNC", { fg = c.fg_dim, bg = c.bg })
hl("WinSeparator", { fg = c.border })
hl("VertSplit", { fg = c.border })
hl("TabLine", { fg = c.fg_dim, bg = c.bg_alt })
hl("TabLineFill", { fg = c.fg_dim, bg = c.bg_alt })
hl("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
hl("Title", { fg = c.fg, bold = true })

hl("Pmenu", { fg = c.fg, bg = c.bg_panel })
hl("PmenuSel", { fg = c.fg, bg = c.bg_selection })
hl("PmenuMatch", { fg = c.blue, bold = true })
hl("PmenuMatchSel", { fg = c.blue, bg = c.bg_selection, bold = true })
hl("PmenuSbar", { bg = c.bg_hover })
hl("PmenuThumb", { bg = c.fg_disabled })
hl("WildMenu", { fg = c.fg, bg = c.bg_selection })
hl("Question", { fg = c.green })
hl("MoreMsg", { fg = c.green })
hl("ModeMsg", { fg = c.fg })
hl("MsgArea", { fg = c.fg, bg = c.bg })
hl("MsgSeparator", { fg = c.border, bg = c.bg_alt })
hl("ErrorMsg", { fg = c.red })
hl("WarningMsg", { fg = c.amber })

-- Syntax: the Vercel docs scheme. Keywords/operators pink, functions and
-- types purple, strings green, constants/properties blue, comments grey.
hl("Comment", { fg = c.comment, italic = true })
hl("Constant", { fg = c.blue })
hl("String", { fg = c.green })
hl("Character", { fg = c.green })
hl("Number", { fg = c.blue })
hl("Boolean", { fg = c.blue })
hl("Float", { fg = c.blue })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.purple })
hl("Statement", { fg = c.pink })
hl("Conditional", { fg = c.pink })
hl("Repeat", { fg = c.pink })
hl("Label", { fg = c.blue })
hl("Operator", { fg = c.pink })
hl("Keyword", { fg = c.pink })
hl("Exception", { fg = c.pink })
hl("PreProc", { fg = c.pink })
hl("Include", { fg = c.pink })
hl("Define", { fg = c.pink })
hl("Macro", { fg = c.purple })
hl("PreCondit", { fg = c.pink })
hl("Type", { fg = c.purple })
hl("StorageClass", { fg = c.pink })
hl("Structure", { fg = c.purple })
hl("Typedef", { fg = c.purple })
hl("Special", { fg = c.blue })
hl("SpecialChar", { fg = c.teal })
hl("Tag", { fg = c.green })
hl("Delimiter", { fg = c.fg })
hl("SpecialComment", { fg = c.comment, italic = true })
hl("Debug", { fg = c.amber })
hl("Underlined", { fg = c.blue, underline = true })
hl("Ignore", { fg = c.fg_disabled })
hl("Error", { fg = c.red })
hl("Todo", { fg = c.bg, bg = c.blue, bold = true })

hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.amber })
hl("DiagnosticInfo", { fg = c.blue })
hl("DiagnosticHint", { fg = c.fg_muted })
hl("DiagnosticOk", { fg = c.green })
hl("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.amber, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.blue, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.fg_muted, undercurl = true })
hl("DiagnosticVirtualTextError", { fg = c.red, bg = c.err_bg })
hl("DiagnosticVirtualTextWarn", { fg = c.amber, bg = c.warn_bg })
hl("DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.info_bg })
hl("DiagnosticVirtualTextHint", { fg = c.fg_muted, bg = c.bg_hover })
hl("LspReferenceText", { bg = c.bg_selection })
hl("LspReferenceRead", { bg = c.bg_selection })
hl("LspReferenceWrite", { bg = c.bg_selection, underline = true })
hl("LspSignatureActiveParameter", { fg = c.blue, bold = true })
hl("LspInlayHint", { fg = c.fg_dim, bg = c.bg_hover })

hl("DiffAdd", { bg = c.diff_add })
hl("DiffChange", { bg = c.diff_change })
hl("DiffDelete", { fg = c.red, bg = c.diff_delete })
hl("DiffText", { bg = c.diff_text })
hl("Added", { fg = c.green })
hl("Changed", { fg = c.amber })
hl("Removed", { fg = c.red })

hl("GitSignsAdd", { fg = c.green, bg = c.bg })
hl("GitSignsChange", { fg = c.amber, bg = c.bg })
hl("GitSignsDelete", { fg = c.red, bg = c.bg })

hl("SpellBad", { sp = c.red, undercurl = true })
hl("SpellCap", { sp = c.blue, undercurl = true })
hl("SpellLocal", { sp = c.teal, undercurl = true })
hl("SpellRare", { sp = c.purple, undercurl = true })

hl("TreesitterContext", { bg = c.bg_panel })
hl("TreesitterContextLineNumber", { fg = c.fg_dim, bg = c.bg_panel })

hl("@comment", { link = "Comment" })
hl("@constant", { fg = c.blue })
hl("@constant.builtin", { fg = c.blue })
hl("@constant.macro", { fg = c.blue })
hl("@string", { fg = c.green })
hl("@string.escape", { fg = c.teal })
hl("@string.regexp", { fg = c.green })
hl("@string.special", { fg = c.green })
hl("@character", { fg = c.green })
hl("@number", { fg = c.blue })
hl("@boolean", { fg = c.blue })
hl("@float", { fg = c.blue })
hl("@function", { fg = c.purple })
hl("@function.call", { fg = c.purple })
hl("@function.builtin", { fg = c.purple })
hl("@function.macro", { fg = c.purple })
hl("@function.method", { fg = c.purple })
hl("@function.method.call", { fg = c.purple })
hl("@constructor", { fg = c.green })
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.blue })
hl("@variable.parameter", { fg = c.fg })
hl("@variable.member", { fg = c.blue })
hl("@property", { fg = c.blue })
hl("@attribute", { fg = c.purple })
hl("@keyword", { fg = c.pink })
hl("@keyword.function", { fg = c.pink })
hl("@keyword.operator", { fg = c.pink })
hl("@keyword.return", { fg = c.pink })
hl("@keyword.import", { fg = c.pink })
hl("@operator", { fg = c.pink })
hl("@punctuation", { fg = c.fg })
hl("@punctuation.bracket", { fg = c.fg })
hl("@punctuation.delimiter", { fg = c.fg })
hl("@punctuation.special", { fg = c.pink })
hl("@type", { fg = c.purple })
hl("@type.builtin", { fg = c.purple })
hl("@type.definition", { fg = c.purple })
hl("@module", { fg = c.fg })
hl("@label", { fg = c.blue })
hl("@tag", { fg = c.green })
hl("@tag.builtin", { fg = c.green })
hl("@tag.attribute", { fg = c.purple })
hl("@tag.delimiter", { fg = c.fg_muted })
hl("@markup.heading", { fg = c.fg, bold = true })
hl("@markup.strong", { fg = c.fg, bold = true })
hl("@markup.italic", { fg = c.fg, italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.quote", { fg = c.fg_muted, italic = true })
hl("@markup.raw", { fg = c.green })
hl("@markup.link", { fg = c.blue, underline = true })
hl("@markup.link.url", { fg = c.blue, underline = true })
hl("@markup.list", { fg = c.pink })
hl("@diff.plus", { fg = c.green })
hl("@diff.minus", { fg = c.red })
hl("@diff.delta", { fg = c.amber })

hl("@lsp.type.namespace", { fg = c.fg })
hl("@lsp.type.type", { fg = c.purple })
hl("@lsp.type.class", { fg = c.purple })
hl("@lsp.type.enum", { fg = c.purple })
hl("@lsp.type.interface", { fg = c.purple })
hl("@lsp.type.struct", { fg = c.purple })
hl("@lsp.type.typeParameter", { fg = c.purple })
hl("@lsp.type.parameter", { fg = c.fg })
hl("@lsp.type.variable", {})
hl("@lsp.type.property", { fg = c.blue })
hl("@lsp.type.enumMember", { fg = c.blue })
hl("@lsp.type.function", { fg = c.purple })
hl("@lsp.type.method", { fg = c.purple })
hl("@lsp.type.macro", { fg = c.purple })
hl("@lsp.type.keyword", { fg = c.pink })
hl("@lsp.type.comment", {})
hl("@lsp.type.string", { fg = c.green })
hl("@lsp.type.number", { fg = c.blue })
hl("@lsp.typemod.variable.readonly", { fg = c.blue })
hl("@lsp.typemod.variable.defaultLibrary", { fg = c.blue })

hl("LazyNormal", { fg = c.fg, bg = c.bg_panel })
hl("LazyButton", { fg = c.fg, bg = c.bg_hover })
hl("LazyButtonActive", { fg = c.bg, bg = c.fg, bold = true })
hl("LazyH1", { fg = c.bg, bg = c.fg, bold = true })
hl("LazyH2", { fg = c.fg, bold = true })
hl("LazySpecial", { fg = c.blue })
hl("LazyReasonPlugin", { fg = c.purple })
hl("LazyCommit", { fg = c.green })

hl("OilDir", { fg = c.blue })
hl("OilFile", { fg = c.fg })

-- :terminal colours, same ANSI palette as Ghostty's Vercel themes.
local ansi = vim.o.background == "light"
    and { "#171717", "#ea001d", "#297a3a", "#a35200", "#006bff", "#7c00c7", "#067a6e", "#8f8f8f",
          "#666666", "#da2f35", "#398e4a", "#aa4d00", "#0060f1", "#bd2864", "#107d32", "#a8a8a8" }
  or { "#1a1a1a", "#f32e40", "#00ac3a", "#ffae00", "#52a8ff", "#c472fb", "#00aa95", "#a0a0a0",
       "#676767", "#ff6166", "#62c073", "#ffc96b", "#8bc5ff", "#f12b82", "#0ac7b4", "#ededed" }
for i, color in ipairs(ansi) do
  vim.g["terminal_color_" .. (i - 1)] = color
end
