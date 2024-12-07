return {
	"CRAG666/code_runner.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>r", ":RunCode<CR>", { noremap = true, silent = false } },
		{ "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false } },
		{ "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false } },
		{ "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false } },
		{ "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false } },
		{ "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false } },
		{ "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false } },
	},
	opts = {
		function()
			require("code_runner").setup({
				filetype = {
					java = {
						"cd $dir &&",
						"javac $fileName &&",
						"java $fileNameWithoutExt",
					},
					python = "python $fileName",
					typescript = "deno run",
					rust = {
						"cd $dir &&",
						"rustc $fileName &&",
						"$dir/$fileNameWithoutExt",
					},
					haskell = {
						"runghc $fileName"
					},
					c = function()
						local c_base = {
							"cd $dir &&",
							"gcc $fileName -o",
							"/tmp/$fileNameWithoutExt",
						}
						local c_exec = {
							"&& /tmp/$fileNameWithoutExt &&",
							"rm /tmp/$fileNameWithoutExt",
						}
						vim.ui.input({ prompt = "Add more args:" }, function(input)
							c_base[4] = input
							vim.print(vim.tbl_extend("force", c_base, c_exec))
							require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
						end)
					end,
				},
			})
		end,
	},
}
