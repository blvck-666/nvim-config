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

api.nvim_create_user_command("BTOP", M.BTOP, {})
api.nvim_create_user_command("IPY", M.IPY, {})
api.nvim_create_user_command("LazyGit", lazy_git, {})
return M
