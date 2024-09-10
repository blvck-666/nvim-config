return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	config = function()
		require("toggleterm").setup({
			size = 20,
			float_opts = {
				border = "single",
				windblend = 4,
			},
		})
	end,
}
