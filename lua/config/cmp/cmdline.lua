local cmp = require("cmp")
local M = {}

function M.setup()
	-- 禁用 Neovim 原生补全
	vim.o.wildmode = ""
	vim.o.wildmenu = false
	vim.keymap.set("c", "<C-n>", function()
		if cmp.visible() then
			cmp.select_next_item()
		else
			cmp.complete()
		end
	end, { noremap = true, silent = true })

	vim.keymap.set("c", "<C-p>", function()
		if cmp.visible() then
			cmp.select_prev_item()
		else
			cmp.complete()
		end
	end, { noremap = true, silent = true })

	cmp.setup.cmdline(":", {
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		mapping = {
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end, { "c" }),

			["<CR>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					})
					cmp.mapping.complete_common_string()
				else
					fallback()
				end
			end),
		},
		sources = cmp.config.sources({
			{ name = "path" },
			{
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
				-- alphabetical sorting
				sorting_comparator = function(a, b)
					return a.insertText < b.insertText
				end,
			},
		}),
	})
end

return M
