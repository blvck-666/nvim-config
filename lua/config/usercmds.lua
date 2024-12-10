local api = vim.api

local M = {}
local Terminal = require("toggleterm.terminal").Terminal

function M.BTOP()
	local btop = Terminal:new({
		cmd = "btop",
		on_open = function(term)
			api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		direction = "float",
		float_opts = {
			border = "curved",
			width = 80,
			height = 25,
		},
	})
	return btop:toggle()
end

function M.IPY()
	local ipy = Terminal:new({
		cmd = "ipython",
		on_open = function(term)
			api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		direction = "float",
		float_opts = {
			border = "curved",
			width = 100,
			height = 25,
		},
	})
	return ipy:toggle()
end

function lazy_git()
	local lazygit = Terminal:new({
		cmd = "lazygit",
		dir = "git_dir",
		on_open = function(term)
			vim.cmd("startinsert!")
			api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		on_close = function(term)
			vim.cmd("startinsert!")
		end,
		direction = "float",
		float_opts = {
			border = "curved",
			width = 100,
			height = 25,
		},
	})
	return lazygit:toggle()
end

vim.api.nvim_create_user_command("PutSystem", function()
	-- Get the entire buffer content and concatenate it into a single string
	local lines = table.concat(vim.fn.getline(1, "$"), "\n")

	-- Print the command to debug
	print("Command to execute:", lines)

	-- Use vim.fn.system to execute the command and capture the output
	local output = vim.fn.system(lines)

	-- Check for errors in the output
	if vim.v.shell_error ~= 0 then
		print("Error executing command:", output)
		return
	end

	-- Split the output into lines and insert it into the buffer
	vim.api.nvim_put(vim.split(output, "\n"), "l", true, true)
end, { nargs = 0 })

api.nvim_create_user_command("BTOP", M.BTOP, {})
api.nvim_create_user_command("IPY", M.IPY, {})
api.nvim_create_user_command("LazyGit", lazy_git, {})
return M
