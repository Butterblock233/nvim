local M = {}
function M.analyse_config()
	if vim.env.PROF == 1 then
		-- example for lazy.nvim
		-- change this to the correct path for your plugin manager
		local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
		vim.opt.rtp:append(snacks)
		require("snacks.profiler").startup({
			startup = {
				event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
				-- event = "UIEnter",
				-- event = "VeryLazy",
			},
		})
	end
end

function M.analyser()
	require("init")
end

return M
