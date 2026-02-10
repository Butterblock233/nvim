local M = {}

local selected_nodes = {}

--- get tree-sitter node at current cursor position
local function get_node_at_cursor()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local row = cursor[1] - 1
	local col = cursor[2]

	local ok, root_parser = pcall(vim.treesitter.get_parser, 0)
	if not ok or not root_parser then
		return
	end

	local lang_tree = root_parser:language_for_range({ row, col, row, col })

	return lang_tree:named_node_for_range({ row, col, row, col }, { ignore_injections = false })
end

--- select tree-sitter node at current cursor position
local function select_node(node)
	if not node then
		return
	end
	local start_row, start_col, end_row, end_col = node:range()

	local last_line = vim.api.nvim_buf_line_count(0)
	local end_row_pos = math.min(end_row + 1, last_line)
	local end_col_pos = end_col

	if end_row + 1 > last_line then
		local last_line_text = vim.api.nvim_buf_get_lines(0, last_line - 1, last_line, true)[1]
		end_col_pos = #last_line_text
	end

	local mode = vim.api.nvim_get_mode().mode
	if mode ~= "v" and mode ~= "V" and mode ~= "\22" then
		vim.api.nvim_cmd({ cmd = "normal", bang = true, args = { "v" } }, {})
	end

	vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
	vim.cmd("normal! o")
	vim.api.nvim_win_set_cursor(0, { end_row_pos, end_col_pos > 0 and end_col_pos - 1 or 0 })
end

--- Increment selection range
--- when this function is called, the selection range will be increased by one
--- this function will create a new selection and enter visual mode only if
--- tree-sitter node exists at the cursor position
function M.increment_selection()
	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" then
		selected_nodes = {}

		local current_node = get_node_at_cursor()
		if not current_node then
			return
		end

		table.insert(selected_nodes, current_node)
		select_node(current_node)
	elseif mode == "v" or mode == "V" or mode == "\22" then
		if #selected_nodes == 0 then
			local current_node = get_node_at_cursor()
			if not current_node then
				return
			end
			table.insert(selected_nodes, current_node)
		end

		local current_node = selected_nodes[#selected_nodes]

		if not current_node then
			return
		end

		local node = current_node
		local root_searched = false
		while true do
			local parent = node:parent()
			if not parent then
				if root_searched then
					return
				end
				local ok, root_parser = pcall(vim.treesitter.get_parser)
				if not ok or root_parser == nil then
					return
				end

				local range = { node:range() }
				local current_parser = root_parser:language_for_range(range)

				if root_parser ~= current_parser then
					local parser = current_parser:parent()
					if parser == nil then
						return
					end
					current_parser = parser
				end

				if root_parser == current_parser then
					root_searched = true
				end

				parent = current_parser:named_node_for_range(range)
				if parent == nil then
					return
				end
			end

			local range = { node:range() }
			local parent_range = { parent:range() }
			if not vim.deep_equal(range, parent_range) then
				table.insert(selected_nodes, parent)
				select_node(parent)
				return
			end
			node = parent
		end
	end
end

--- Decrement selection range
--- This function will decrease the selection range by one
--- if only one node selected, it will delete the selection range
--- and return to previous mode. If no node is selected, the operation will be ignored
function M.decrement_selection()
	if #selected_nodes > 1 then
		table.remove(selected_nodes)
		local current_node = selected_nodes[#selected_nodes]
		if current_node then
			select_node(current_node)
		end
	elseif #selected_nodes == 1 then
		selected_nodes = {}
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
	end
end

return M