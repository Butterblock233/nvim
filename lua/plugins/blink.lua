return {
  "saghen/blink.cmp",
  cond = (vim.env.USE_BLINK == "true"),
  dependencies = {
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    "xzbdmw/colorful-menu.nvim",
  },
  version = "1.*",

  opts = function()
    return {
      use_nvim_cmp_as_default = true,

      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept" },
      },

      completion = {
        list = {
          selection = { preselect = true },
        },
        accept = {
          auto_brackets = { enabled = true },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 40,
        },
        ghost_text = { enabled = vim.g.ai_cmp },

        menu = {
          draw = {
            treesitter = { "lsp" },
            -- We don't need label_description now because label and label_description are already
            -- combined together in label by colorful-menu.nvim.
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 1 },
            },
            components = {
              label = {
                width = { fill = true, max = 60 },
                text = function(ctx)
                  local highlights_info =
                    require("colorful-menu").blink_highlights(ctx)
                  if highlights_info ~= nil then
                    -- Or you want to add more item to label
                    return highlights_info.label
                  else
                    return ctx.label
                  end
                end,
                highlight = function(ctx)
                  local highlights = {}
                  local highlights_info =
                    require("colorful-menu").blink_highlights(ctx)
                  if highlights_info ~= nil then
                    highlights = highlights_info.highlights
                  end
                  for _, idx in ipairs(ctx.label_matched_indices) do
                    table.insert(
                      highlights,
                      { idx, idx + 1, group = "BlinkCmpLabelMatch" }
                    )
                  end
                  -- Do something else
                  return highlights
                end,
              },
            },
          },
        },

        appearance = {
          nerd_font_variant = "mono",
          kind_icons = require("lspkind").presets.default,
          use_nvim_cmp_as_default = false,
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        opts_extend = { "sources.default" },
      },
    }
  end,
}
