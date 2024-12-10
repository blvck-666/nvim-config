return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local function lsp_status()
			local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
			if not next(clients) then
				return "No LSP"
			end

			local status = {}

			local icon = " "

			-- Get the name of the first active LSP client for the current buffer
			local client_names = {}
			for _, client in ipairs(clients) do
				table.insert(client_names, client.name)
			end

			if next(client_names) then
				table.insert(status, icon .. table.concat(client_names, ", "))
			end

			return table.concat(status, " ")
		end
		require("lualine").setup({
			options = {
				theme = "onedark_dark",
				icons_enable = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = { lsp_status, "filetype", "fileformat" },
				lualine_z = { "location" },
			},
		})
	end,
}
