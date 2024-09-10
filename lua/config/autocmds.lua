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
