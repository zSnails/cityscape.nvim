if not vim.fn.has("nvim-0.8") then
    vim.api.nvim_err_writeln("cityscape: this colorscheme requires nvim-0.8+")
    return
end

local colors = {
    -- Yellow = "#f2e76e",
    Yellow = "#f7e736",
    CursorLineBG = "#1a1a1a",
    SoftGreen = "#79f26e",
    Razzmatazz = "#ff0a78",
    Background = "#1E1E1E",
    BackgroundAlt = "#2a2a2a",
    Gold = "#D9B930",
    Rose = "#f070ac",
    Bleu = "#0692ef",
    VividSkyBlue = "#4cc9f0",
    PaleAzure = "#6ECBF5",
    SpecialFunctions = "#48f9b8",
    RobinEggBlue = "#47D4DE",
    Comment = "#a0a7c5",
    Sapphire = "#0650B2",
    Foreground = "#eff0f5",
    ForegroundAlt = "#e8ebfd",
    Orange = "#ffca38",
    LinkYellow = "#fff700"
}

local defaultGroups = {
    debugBreakpoint = { bg = colors.Rose },
    debugPC = { bg = colors.CursorLineBG },
    Visual = { bg = colors.ForegroundAlt, fg = colors.Background },
    VisualNOS = { link = "Visual" },
    DiagnosticError = { link = "Error" },
    DiagnosticWarn = { link = "WarningMsg" },
    DiagnosticInfo = { fg = colors.RobinEggBlue },
    DiagnosticHint = { fg = colors.VividSkyBlue },
    Normal = { fg = colors.Foreground, bg = colors.Background, },
    EndOfBuffer = { fg = colors.Foreground, bg = colors.Background },
    Cursor = { bg = colors.Foreground, fg = colors.Foreground },
    TermCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    ErrorMsg = { fg = colors.Razzmatazz, },
    Error = { link = "ErrorMsg" },
    WarningMsg = { fg = colors.Yellow },
    Comment = { fg = colors.Comment, italic = true },
    Constant = { fg = colors.RobinEggBlue },
    String = { fg = colors.SoftGreen },
    Number = { fg = colors.Rose },
    Float = { link = "Number" },
    Boolean = { fg = colors.Razzmatazz, italic = true, bold = true },
    Identifier = { fg = colors.ForegroundAlt },
    Function = { fg = colors.PaleAzure },
    Statement = { fg = colors.Razzmatazz },
    Conditional = { fg = colors.Razzmatazz, bold = true, italic = true },
    Operator = { fg = colors.Gold },
    Keyword = { fg = colors.Razzmatazz, italic = true, bold = true },
    PreProc = { fg = colors.Razzmatazz },
    Type = { fg = colors.SpecialFunctions },
    StorageClass = { fg = colors.PaleAzure },
    Special = { fg = colors.Orange },
    Character = { link = "Special" },
    ColorColumn = { fg = colors.CursorLineBG },
    Todo = { fg = colors.Razzmatazz },
    Search = { bg = colors.PaleAzure, fg = colors.Background },
    LineNr = { fg = colors.ForegroundAlt, bg = colors.BackgroundAlt, bold = true, italic = true },
    CursorLineNr = { link = "LineNr" },
    CursorLine = { bg = colors.CursorLineBG },
    CursorColumn = { bg = colors.CursorLineBG },
    WinBar = { bg = colors.Background },
    Folded = { bg = colors.CursorLineBG, fg = colors.ForegroundAlt },
    FoldColumn = { bg = colors.CursorLineBG, fg = colors.Foreground },
    StatusLine = { fg = colors.Foreground, bg = colors.Background },
    StatusLineNC = { fg = colors.ForegroundAlt },
    SpecialKey = { fg = colors.Razzmatazz },
    Nontext = { link = "Comment" },
    Pmenu = { bg = colors.BackgroundAlt },
    PmenuSel = { bg = colors.Foreground, fg = colors.BackgroundAlt },
    PmenuThumb = { fg = colors.Sapphire },
    PmenuKind = { link = "Comment" },
    PmenuExtra = { link = "Comment" },
    MatchParen = { bg = colors.Background, fg = colors.Orange, bold = true },
    ["@parameter"] = { fg = colors.Orange },
    ["@type.builtin"] = { fg = colors.RobinEggBlue },
    ["@constant.builtin"] = { link = "@type.builtin" },
    ["@variable.builtin"] = { fg = colors.Razzmatazz, italic = true },
    ["@method"] = { link = "Function" },
    ["@lsp.mod.readonly"] = { fg = colors.RobinEggBlue },
    ["@lsp.mod.importDeclaration"] = { link = "@lsp.mod.readonly" },
    ["@lsp.type.enumMember"] = { link = "Constant" },
    ["@function.builtin"] = { link = "@type.builtin" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { fg = colors.PaleAzure },
    ["@field"] = { fg = colors.Orange },
    ["@field.lua"] = { fg = colors.ForegroundAlt },
    ["@lsp.type.property.lua"] = { fg = colors.ForegroundAlt },
    ["@character"] = { fg = colors.PaleAzure },
    ["@tag.delimiter"] = { fg = colors.Foreground },
    ["@punctuation.delimiter"] = { fg = colors.Foreground },
    ["@punctuation.bracket"] = { fg = colors.Foreground },
    ["@punctuation.special.markdown"] = { fg = colors.Orange, bold = true },
    markdownListMarker = { link = "@punctuation.special.markdown" },
    ["@text.reference.markdown_inline"] = { fg = colors.LinkYellow, underline = true },
    markdownLinkText = { link = "@text.reference.markdown_inline" },
    ["@type.qualifier"] = { link = "Type" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.variable"] = { link = "Identifier" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@field" },
    ["@property.tsx"] = { link = "Identifier" },
    ["@tag.attribute.tsx"] = { link = "Identifier" },
    ["@keyword.return"] = { fg = colors.SoftGreen, italic = true, bold = true },
    ["@lsp.typemod.variable.global"] = { link = "Constant" },
    ["@text.title"] = { fg = colors.Razzmatazz, bold = true },
    ["@tag.html"] = { link = "Special" },
    htmlTagName = { link = "@tag.html" },
    htmlTagN = { link = "Special" },
    htmlTag = { link = "Special" },
    htmlEndTag = { link = "Special" },
    ["@tag.attribute.html"] = { fg = colors.SoftGreen },
    DiffAdd = { fg = colors.SoftGreen, bg = colors.BackgroundAlt },
    Title = { link = "@text.title" },
    DiffChange = { fg = colors.Yellow, bg = colors.BackgroundAlt },
    DiffDelete = { fg = colors.Razzmatazz, bg = colors.BackgroundAlt },
    NvimTreeGitNew = { link = "DiffAdd" },
    NvimTreeGitDeleted = { link = "DiffDelete" },
    NvimTreeGitDirty = { fg = colors.Yellow },
    SignColumn = { bg = colors.BackgroundAlt },
    NvimTreeFolderName = { fg = colors.Orange },
    NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
    NvimTreeEmptyFolderName = { link = "NvimTreeFolderName" },
    NvimTreeGitStaged = { fg = colors.SoftGreen },
    Directory = { fg = colors.Orange },
    netrwClassify = { link = "Directory" },
    netrwPlain = { fg = colors.Foreground },
    BufferCurrent = { bg = colors.Background, bold = true },
    BufferCurrentMod = { bg = colors.Background, fg = colors.Razzmatazz, bold = true },
    BufferCurrentSign = { bg = colors.Background, fg = colors.Razzmatazz },
    BufferInactive = { fg = colors.ForegroundAlt, bg = colors.Background },
    BufferVisible = { link = "BufferDefaultInactive" },
    BufferInactiveSign = { bg = colors.Background, fg = colors.VividSkyBlue },
    VertSplit = { bg = colors.Background, fg = colors.BackgroundAlt },
    WinSeparator = { link = "VertSplit" },
    masmDirective = { fg = colors.Orange, bold = true },
    masmText = { fg = colors.SoftGreen },
    masmOption = { fg = colors.VividSkyBlue },
    masmOpcode = { fg = colors.Razzmatazz, bold = true },
    masmRegister = { fg = colors.PaleAzure },
    masmLabel = { fg = colors.SoftGreen, bold = true },
    MoreMsg = { fg = colors.Orange },
    Question = { link = "MoreMsg" }
}

local barbarGroups = {

    BufferCurrent        = { bg = colors.BackgroundAlt },
    BufferCurrentIndex   = { bg = colors.BackgroundAlt },
    BufferCurrentMod     = { bg = colors.BackgroundAlt, fg = colors.Razzmatazz, italic = true },
    BufferCurrentSign    = { bg = colors.BackgroundAlt, fg = colors.Razzmatazz },
    BufferCurrentTarget  = { bg = colors.BackgroundAlt },

    BufferVisible        = { bg = colors.Background },
    BufferVisibleMod     = { bg = colors.Background },
    BufferVisibleIndex   = { bg = colors.Background },
    BufferVisibleSign    = { bg = colors.Background },
    BufferVisibleTarget  = { bg = colors.Background },

    BufferInactive       = { bg = colors.Background },
    BufferInactiveIndex  = { bg = colors.Background },
    BufferInactiveMod    = { bg = colors.Background, fg = colors.Razzmatazz, italic = true },
    BufferInactiveSign   = { bg = colors.Background, fg = colors.BackgroundAlt },
    BufferInactiveTarget = { bg = colors.Background }

}

local cmpGroups = {
    CmpItemAbbr = { fg = colors.Foreground },
    CmpItemMenu = { link = "Comment" },
    CmpItemAbbrDeprecated = { strikethrough = true, fg = colors.ForegroundAlt },
    CmpItemAbbrMatch = { fg = colors.Yellow },
    CmpItemKind = { fg = colors.Rose },
    CmpItemKindText = { fg = colors.Foreground },
    CmpItemKindMethod = { fg = colors.Orange },
    CmpItemKindFunction = { fg = colors.Razzmatazz },
    CmpItemKindConstructor = { link = "Type" },
    CmpItemKindField = { fg = colors.Orange },
    CmpItemKindVariable = { fg = colors.SoftGreen },
    CmpItemKindClass = { link = "Type" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindModule = { fg = colors.SoftGreen },
    CmpItemKindProperty = { link = "CmpItemKindField" },
    CmpItemKindUnit = { fg = colors.SoftGreen },
    CmpItemKindValue = { fg = colors.VividSkyBlue },
    CmpItemKindEnum = { link = "Type" },
    CmpItemKindKeyword = { fg = colors.Razzmatazz },
    CmpItemKindSnippet = { fg = colors.RobinEggBlue },
    CmpItemKindColor = { fg = colors.Orange },
    CmpItemKindFile = { fg = colors.Foreground },
    CmpItemKindReference = { fg = colors.VividSkyBlue },
    CmpItemKindFolder = { fg = colors.Orange },
    CmpItemKindEnumMember = { link = "CmpItemKindEnum" },
    CmpItemKindStruct = { link = "Type" },
    CmpItemKindEvent = { fg = colors.LinkYellow },
    CmpItemKindOperator = { link = "Operator" },
    CmpItemKindTypeParameter = { link = "@lsp.type.parameter" },
}

local function hi(group, options)
    vim.api.nvim_set_hl(0, group, options)
end

local function register(group)
    for g, options in pairs(group) do
        hi(g, options)
    end
end

if vim.g.colors_name then
    vim.cmd("hi clear")
end

vim.g.colors_name = "cityscape"
vim.o.termguicolors = true

--- Always register the default groups
register(defaultGroups)
register(barbarGroups)

--- Check if cmp is installed before loading Cmp hl groups
local ok, _ = pcall(require, "cmp")
if ok then
    register(cmpGroups)
end

-- local ok, _ = pcall(require, "barbar.nvim")
-- if ok then
-- end
