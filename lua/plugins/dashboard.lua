return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	opts = function()
		local logo = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⡠⠤⠄⠤⠤⠠⠄⠄⠤⠠⠠⠄⠄⠤⠤⠠⠤⣄⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣀⡤⠤⠖⠂⠊⠁⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣰⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢠⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣀⣀⡀⣀⡀⡀⣀⢀⡀⣀⣀⡀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠛⠓⠂⠒⠒⠂⠒⠒⠂⠒⠂⠒⠂⠒⠐⠐⠂⠛⠙⠃⠙⠙⠃⠓⠒⠂⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣤⣴⣶⣶⣶⣶⣦⣶⣶⣶⣶⣶⣶⣿⣯⣯⢷⣿⣾⡿⢿⠛⠛⠛⠻⠿⠷⢶⣿⣵⣦⡤⣄⠀⠀⠀⠀⠀
⠀⠀⠀⢀⡾⣿⡿⠭⠟⠛⠛⠛⠛⣷⠒⠂⠀⠀⢸⣥⣿⡽⣟⣻⣿⣞⣏⠏⠀⠀⠀⠒⠒⣲⠟⠁⠀⠉⠉⠓⠫⣷⣄⡀⠀
⠀⣠⢾⣿⡞⠁⠀⠀⠀⠀⠀⠀⠀⠙⣯⠉⣀⠄⠀⠙⢿⣛⣿⣿⣷⠞⠋⠀⠀⢤⣀⡠⣾⠏⠀⠀⠀⠀⠀⠀⠀⠀⢉⣽⠷
⡟⠁⠀⠉⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣷⣄⡤⠄⢀⡀⠀⡀⠀⢀⠀⠘⢦⣠⡮⠋⠁⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀
⢻⡄⠀⠀⠀⠻⣢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠿⣝⣷⣯⣤⣴⣁⣀⣸⣤⡶⠝⠋⠀⠀⠀⠀⠀⠀⠀⣀⣤⠔⠋⠁⣠⠖⠉
⠀⠉⠛⠛⠒⠚⠛⠛⠟⠛⠓⠚⠛⠳⠶⣢⣤⡤⣀⣉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⣀⡤⠾⠋⠉⠁⣀⡤⠚⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠓⣒⣶⣤⡤⠶⠶⠶⠖⠒⠒⠋⠁⠀⣀⡤⠖⠋⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠒⠒⠒⠒⠒⠒⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
		]]
		logo = string.rep("\n", 8) .. logo .. "\n\n"
		local opts = {
			theme = "hyper",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				week_header = {
					enable = false,
				},
				shortcut = {},
				package = { enable = true },
				project = { enable = false },
				mru = {},
				footer = {},
			},
		}
		if vim.o.filetype == "lazy" then
			vim.api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(vim.api.nvim_get_current_win()),
				once = true,
				callback = function()
					vim.schedule(function()
						vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
					end)
				end,
			})
		end
		return opts
	end,
}
