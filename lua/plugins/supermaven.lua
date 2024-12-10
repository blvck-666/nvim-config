return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggenstion = "<Tab>",
				clear_suggestionn = "<C-]>",
				accepts_word = "<C-j>",
			},
		})
	end,
}
