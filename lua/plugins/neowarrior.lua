return {
	"duckdm/neowarrior.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local nw = require("neowarrior")
		local home = vim.env.HOME
		nw.setup({
			report = "next",
			filter = "\\(due.before:2d or due: \\)",
			dir_setup = {
				{
					dir = home .. "/dev/nvim/neowarrior.nvim",
					filter = "project:neowarrior",
					mode = "tree",
					expanded = true,
				},
			},
			colors = {
				neowarrior = { group = "NeoWarrior", fg = "#3eeafa", bg = "black" },
				neowarrior_inverted = { group = "NeoWarriorInverted", fg = "black", bg = "#3cc8d7" },
				default = { group = "", fg = nil, bg = nil },
				dim = { group = "NeoWarriorTextDim", fg = "#333333", bg = nil },
				danger = { group = "NeoWarriorTextDanger", fg = "#cc0000", bg = nil },
				warning = { group = "NeoWarriorTextWarning", fg = "#ccaa00", bg = nil },
				success = { group = "NeoWarriorTextSuccess", fg = "#00cc00", bg = nil },
				info = { group = "NeoWarriorTextInfo", fg = "#00aaff", bg = nil },
				danger_bg = { group = "NeoWarriorTextDangerBg", fg = "#ffffff", bg = "#cc0000" },
				info_bg = { group = "NeoWarriorTextInfoBg", fg = "#000000", bg = "#00aaff" },
				project = { group = "NeoWarriorGroup", fg = "#00aaff", bg = nil },
				annotation = { group = "NeoWarriorAnnotation", fg = "#00aaff", bg = nil },
				tag = { group = "NeoWarriorTag", fg = "#ffffff", bg = "#333333" },
				current_date = { group = "NeoWarriorCurrentDate", fg = "#000000", bg = "#00aaff" },
				marked_date = { group = "NeoWarriorMarkedDate", fg = "#ffffff", bg = "#00aa66" },
			},
			float = {
				width = 60,
				height = 0.7,
			},
		})

		vim.keymap.set("n", "<leader>nw", function()
			nw.open_below()
			local win_id = vim.api.nvim_get_current_win()
			-- local buf_name = vim.api.nvim_buf_get_name(buf_id)

			vim.api.nvim_set_option_value("number", false, { win = win_id })
		end, { desc = "Open nwarrior below current buffer" })
	end,
}
