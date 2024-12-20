-- [[ AUTO COMMAND ]] --
--
local yank_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	pattern = "*",
	group = yank_group,
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
})

-- vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter" }, {
-- 	pattern = "neowarrior",
-- 	group = neowarrior_group,
-- 	callback = function()
-- 		local win_id = vim.api.nvim_get_current_win()
-- 		vim.api.nvim_set_option_value("number", false, { win = win_id })
-- 		vim.api.nvim_set_option_value("relativenumber", false, { win = win_id })
-- 	end,
-- })

-- vim.api.nvim_create_autocmd({ "WinEnter" }, {
-- 	pattern = "neowarrior",
-- 	group = neowarrior_group,
-- 	callback = function()
-- 		local win_id = vim.api.nvim_get_current_win()
-- 		vim.api.nvim_set_option_value("number", false, { win = win_id })
-- 		vim.api.nvim_set_option_value("relativenumber", false, { win = win_id })
-- 		vim.print("hi Motherfucker")
-- 	end,
-- })

-- local neowarrior_group = vim.api.nvim_create_augroup("neowarrior", { clear = true })
--
-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	group = neowarrior_group,
-- 	pattern = "*neowarrior*",
-- 	callback = function()
-- 		local win_id = vim.api.nvim_get_current_win()
-- 		local bufname = vim.api.nvim_buf_get_name(0)
--
-- 		if string.match(bufname, "neowarrior") then
-- 			-- Using buffer-local window options
-- 			vim.api.nvim_set_option_value("number", false, { win = win_id })
-- 			vim.api.nvim_set_option_value("relativenumber", false, { win = win_id })
-- 		end
-- 	end,
-- })
