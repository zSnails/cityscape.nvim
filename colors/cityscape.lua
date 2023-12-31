if not vim.fn.has("nvim-0.8") then
    vim.api.nvim_err_writeln("cityscape: this colorscheme requires nvim-0.8+")
    return
end

local colors = {
    Maize = "#efef06",
    CursorLineBG = "#02204a",
    GrassGreen = "#94f377",
    Razzmatazz = "#EF0671",
    Rose = "#ff0a78",
    ChefchaouenBlue = "#4895ef",
    VividSkyBlue = "#4cc9f0",
    PaleAzure = "#6ECBF5",
    RobinEggBlue = "#47D4DE",
    OxfordBlue = "#010d1e",
    Sapphire = "#0650B2",
    Foreground = "#f6f6f6",
    ForegroundAlt = "#cccccc",
    Orange = "#ffca38",
    LinkYellow = "#fff700"
}

local defaultGroups = {
    debugBreakpoint = { bg = colors.Rose },
    debugPC = { bg = colors.CursorLineBG },
    Visual = { bg = colors.ForegroundAlt, fg = colors.OxfordBlue },
    VisualNOS = { link = "Visual" },
    DiagnosticError = { link = "Error" },
    DiagnosticWarn = { link = "WarningMsg" },
    DiagnosticInfo = { fg = colors.RobinEggBlue },
    DiagnosticHint = { fg = colors.VividSkyBlue },
    Normal = { fg = colors.Foreground, bg = colors.OxfordBlue, },
    EndOfBuffer = { fg = colors.Foreground, bg = colors.OxfordBlue },
    Cursor = { bg = colors.Foreground, fg = colors.Foreground },
    TermCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    ErrorMsg = { fg = colors.Razzmatazz, },
    Error = { link = "ErrorMsg" },
    WarningMsg = { fg = colors.Maize },
    Comment = { fg = colors.ChefchaouenBlue },
    Constant = { fg = colors.RobinEggBlue },
    String = { fg = colors.GrassGreen },
    Number = { fg = colors.PaleAzure },
    Float = { link = "Number" },
    Boolean = { fg = colors.Razzmatazz },
    Identifier = { fg = colors.ForegroundAlt },
    Function = { fg = colors.PaleAzure },
    Statement = { fg = colors.Razzmatazz },
    Conditional = { fg = colors.Razzmatazz },
    Operator = { fg = colors.Rose },
    Keyword = { fg = colors.Rose },
    PreProc = { fg = colors.Razzmatazz },
    Type = { fg = colors.Orange },
    StorageClass = { fg = colors.PaleAzure },
    Special = { fg = colors.Razzmatazz },
    Character = { link = "Special" },
    ColorColumn = { fg = colors.CursorLineBG },
    Todo = { fg = colors.Razzmatazz },
    Search = { bg = colors.PaleAzure, fg = colors.OxfordBlue },
    LineNr = { fg = colors.ForegroundAlt, bg = colors.OxfordBlue },
    CursorLineNr = { bold = true },
    CursorLine = { bg = colors.CursorLineBG },
    CursorColumn = { bg = colors.CursorLineBG },
    Folded = { bg = colors.CursorLineBG, fg = colors.ForegroundAlt },
    FoldColumn = { bg = colors.CursorLineBG, fg = colors.Foreground },
    StatusLine = { fg = colors.Foreground, bg = colors.CursorLineBG },
    StatusLineNC = { fg = colors.ForegroundAlt },
    SpecialKey = { fg = colors.Razzmatazz },
    Nontext = { link = "Comment" },
    Pmenu = { bg = colors.CursorLineBG },
    PmenuSel = { bg = colors.Razzmatazz, },
    PmenuThumb = { fg = colors.Sapphire },
    PmenuKind = { link = "Comment" },
    PmenuExtra = { link = "Comment" },
    MatchParen = { bg = colors.Maize, fg = colors.OxfordBlue },
    ["@parameter"] = { fg = colors.Orange },
    ["@type.builtin"] = { fg = colors.RobinEggBlue },
    ["@constant.builtin"] = { fg = colors.GrassGreen },
    ["@variable.builtin"] = { link = "@constant.builtin" },
    ["@method"] = { link = "Function" },
    ["@lsp.mod.readonly"] = { fg = colors.RobinEggBlue },
    ["@lsp.mod.importDeclaration"] = { link = "@lsp.mod.readonly" },
    ["@lsp.mod.defaultLibrary"] = { link = "Special" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { fg = colors.PaleAzure },
    ["@field"] = { fg = colors.Foreground },
    ["@punctuation.delimiter"] = { fg = colors.Foreground },
    ["@punctuation.bracket"] = { fg = colors.Foreground },
    ["@punctuation.special.markdown"] = { fg = colors.Orange, bold = true },
    markdownListMarker = { link = "@punctuation.special.markdown" },
    ["@text.reference.markdown_inline"] = { fg = colors.LinkYellow, underline = true },
    markdownLinkText = { link = "@text.reference.markdown_inline" },
    ["@type.qualifier"] = { fg = colors.Razzmatazz },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.variable"] = { link = "Identifier" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@field" },
    ["@lsp.typemod.variable.global"] = { fg = colors.VividSkyBlue },
    ["@text.title"] = { fg = colors.Rose, bold = true },
    ["@tag.html"] = { fg = colors.VividSkyBlue },
    htmlTagName = { link = "@tag.html" },
    htmlTagN = { link = "Special" },
    htmlTag = { link = "Special" },
    htmlEndTag = { link = "Special" },
    ["@tag.attribute.html"] = { fg = colors.GrassGreen },
    DiffAdd = { fg = colors.GrassGreen },
    Title = { link = "@text.title" },
    DiffChange = { fg = colors.Maize },
    DiffDelete = { fg = colors.Razzmatazz },
    NvimTreeGitNew = { link = "DiffAdd" },
    NvimTreeGitDeleted = { link = "DiffDelete" },
    NvimTreeGitDirty = { fg = colors.Maize },
    SignColumn = { link = "Normal" },
    NvimTreeFolderName = { fg = colors.Orange },
    NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
    NvimTreeEmptyFolderName = { link = "NvimTreeFolderName" },
    NvimTreeGitStaged = { fg = colors.GrassGreen },
    Directory = { fg = colors.Orange },
    netrwClassify = { link = "Directory" },
    netrwPlain = { fg = colors.Foreground },
    BufferCurrent = { bg = colors.OxfordBlue, bold = true },
    BufferCurrentMod = { bg = colors.OxfordBlue, fg = colors.Razzmatazz, bold = true },
    BufferCurrentSign = { bg = colors.OxfordBlue, fg = colors.Razzmatazz },
    BufferInactive = { fg = colors.ForegroundAlt, bg = colors.OxfordBlue },
    BufferVisible = { link = "BufferDefaultInactive" },
    BufferInactiveSign = { bg = colors.OxfordBlue, fg = colors.VividSkyBlue },
    VertSplit = { link = "Normal" },
    masmDirective = { fg = colors.Orange, bold = true },
    masmText = { fg = colors.GrassGreen },
    masmOption = { fg = colors.VividSkyBlue },
    masmOpcode = { fg = colors.PaleAzure, bold = true },
    masmLabel = { fg = colors.GrassGreen, bold = true },
}

local cmpGroups = {
    CmpItemAbbr = { fg = colors.Foreground },
    CmpItemMenu = { link = "Comment" },
    CmpItemAbbrDeprecated = { strikethrough = true, fg = colors.ForegroundAlt },
    CmpItemAbbrMatch = { fg = colors.Maize },
    CmpItemKind = { fg = colors.Rose },
    CmpItemKindText = { fg = colors.Foreground },
    CmpItemKindMethod = { fg = colors.Orange },
    CmpItemKindFunction = { fg = colors.Razzmatazz },
    CmpItemKindConstructor = { link = "Type" },
    CmpItemKindField = { fg = colors.Orange },
    CmpItemKindVariable = { fg = colors.GrassGreen },
    CmpItemKindClass = { link = "Type" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindModule = { fg = colors.GrassGreen },
    CmpItemKindProperty = { link = "CmpItemKindField" },
    CmpItemKindUnit = { fg = colors.GrassGreen },
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


--- Check if cmp is installed before loading Cmp hl groups
local cmp, _ = pcall(require, "cmp")

if cmp then
    register(cmpGroups)
end
