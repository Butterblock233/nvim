local M = {}

--- Get relative path from current working directory
--- input: let a = 1
--- output: @main.swift 1-1 let a = 1
--- @param path string
--- @return string
function M.get_relative_path(path)
	local cwd = vim.fn.getcwd()
	-- Normalize path separators for cross-platform compatibility
	local normalized_cwd = vim.fn.substitute(cwd, '\\', '/', 'g')
	local normalized_path = vim.fn.substitute(path, '\\', '/', 'g')
	
	if vim.startswith(normalized_path, normalized_cwd) then
		local relative_path = vim.fn.substitute(normalized_path, '^' .. vim.fn.escape(normalized_cwd, '\\') .. '/\\?', '', '')
		-- Use backslash on Windows, forward slash on Unix
		if vim.fn.has('win32') == 1 then
			return vim.fn.substitute(relative_path, '/', '\\', 'g')
		end
		return relative_path
	end
	return path
end

--- Get visual selection text using system yank
--- @return string
--- The selected text, or empty string if not in visual mode
function M.get_visual_selection()
	-- Yank selection to temporary register a
	vim.cmd('normal! "ay')

	-- Get the yanked text
	return vim.fn.getreg("a")
end

--- Format selection with file context and copy to clipboard
--- @param selected_text string
--- @return string
--- Formatted text in "@filename start-end\nselected_text" format
function M.format_and_copy_selection(selected_text)
	if selected_text == "" then
		vim.notify("No visual selection found", vim.log.levels.WARN)
		return ""
	end

	local bufname = vim.fn.bufname()
	-- Get full path and convert to relative path
	local full_path = vim.fn.fnamemodify(bufname, ":p")
	local filename = M.get_relative_path(full_path)
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	local formatted_text = string.format("@%s %d-%d\n%s", filename, start_pos[2], end_pos[2], selected_text)

	-- Copy to clipboard
	vim.fn.setreg("+", formatted_text)
	vim.fn.setreg("*", formatted_text)
	vim.notify("Selection copied to clipboard", vim.log.levels.INFO)

	return formatted_text
end

--- Convert visual selection to AI-readable format with file context and copy to clipboard
--- Formatted text in 
--- 
--- "@filename start-end
--- selected_text"
---
--- format and copy to clipboard
function M.copy_with_content()
	-- Get the yanked text
	local selected_text = M.get_visual_selection()

	if selected_text == "" then
		vim.notify("No visual selection found", vim.log.levels.WARN)
		return ""
	end

	local bufname = vim.fn.bufname()
	-- Get full path and convert to relative path
	local full_path = vim.fn.fnamemodify(bufname, ":p")
	local filename = M.get_relative_path(full_path)
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	local formatted_text = string.format("@%s %d-%d\n%s", filename, start_pos[2], end_pos[2], selected_text)

	-- Copy to clipboard
	vim.fn.setreg("+", formatted_text)
	vim.fn.setreg("*", formatted_text)
	vim.notify("Selection copied to clipboard", vim.log.levels.INFO)

end

return M

