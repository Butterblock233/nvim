local M = {}
-- Material 3 palette (light/dark)
M.M3 = {
  dark = {
    primary          = "#D0BCFF",
    onPrimary        = "#381E72",
    primaryContainer = "#4F378B",
    onPrimaryContainer = "#EADDFF",

    secondary          = "#CCC2DC",
    onSecondary        = "#332D41",
    secondaryContainer = "#4A4458",
    onSecondaryContainer = "#E8DEF8",

    tertiary          = "#EFB8C8",
    onTertiary        = "#492532",
    tertiaryContainer = "#633B48",
    onTertiaryContainer = "#FFD8E4",

    error          = "#F2B8B5",
    onError        = "#601410",
    errorContainer = "#8C1D18",
    onErrorContainer = "#F9DEDC",

    background = "#1C1B1F",
    onBackground = "#E6E1E5",
    surface = "#1C1B1F",
    onSurface = "#E6E1E5",
    surfaceVariant = "#49454F",
    onSurfaceVariant = "#CAC4D0",
    outline = "#938F99",
  },

  light = {
    primary          = "#6750A4",
    onPrimary        = "#FFFFFF",
    primaryContainer = "#EADDFF",
    onPrimaryContainer = "#21005D",

    secondary          = "#625B71",
    onSecondary        = "#FFFFFF",
    secondaryContainer = "#E8DEF8",
    onSecondaryContainer = "#1D192B",

    tertiary          = "#7D5260",
    onTertiary        = "#FFFFFF",
    tertiaryContainer = "#FFD8E4",
    onTertiaryContainer = "#31111D",

    error          = "#B3261E",
    onError        = "#FFFFFF",
    errorContainer = "#F9DEDC",
    onErrorContainer = "#410E0B",

    background = "#FEF7FF",
    onBackground = "#1C1B1F",
    surface = "#FFFBFE",
    onSurface = "#1C1B1F",
    surfaceVariant = "#E7E0EC",
    onSurfaceVariant = "#49454F",
    outline = "#79747E",
  },
}

-- 导出 Markdown 标题所用的高亮组，供其他模块直接 require 使用
M.headings = {
  backgrounds = {
    "RenderMarkdownH1Bg",
    "RenderMarkdownH2Bg",
    "RenderMarkdownH3Bg",
    "RenderMarkdownH4Bg",
    "RenderMarkdownH5Bg",
    "RenderMarkdownH6Bg",
  },
  foregrounds = {
    "RenderMarkdownH1",
    "RenderMarkdownH2",
    "RenderMarkdownH3",
    "RenderMarkdownH4",
    "RenderMarkdownH5",
    "RenderMarkdownH6",
  },
}

function M.apply_m3_headings()
  local p = (vim.o.background == "light") and M.M3.light or M.M3.dark
  local set = function(group, spec) vim.api.nvim_set_hl(0, group, spec) end

  -- 背景条纹（Bg 组只设置 bg，透明请用 NONE）
  set("RenderMarkdownH1Bg", { bg = p.primaryContainer })
  set("RenderMarkdownH2Bg", { bg = p.secondaryContainer })
  set("RenderMarkdownH3Bg", { bg = p.tertiaryContainer })
  set("RenderMarkdownH4Bg", { bg = p.surfaceVariant })
  set("RenderMarkdownH5Bg", { bg = "NONE" })
  set("RenderMarkdownH6Bg", { bg = "NONE" })

  -- 前景（文字）
  set("RenderMarkdownH1", { fg = p.onPrimaryContainer, bold = true })
  set("RenderMarkdownH2", { fg = p.onSecondaryContainer, bold = true })
  set("RenderMarkdownH3", { fg = p.onTertiaryContainer, bold = true })
  set("RenderMarkdownH4", { fg = p.onSurfaceVariant, bold = true })
  set("RenderMarkdownH5", { fg = p.onSurface, bold = true })
  set("RenderMarkdownH6", { fg = p.outline, bold = true })

  -- 可选：分隔线/引用符等更贴近 M3（按需开启）
  -- vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = p.surfaceVariant, fg = p.onSurface })
  -- vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = p.primary })
end

-- 初次与切换主题时自动应用
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  callback = M.apply_m3_headings,
})

return M
