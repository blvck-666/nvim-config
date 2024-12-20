-- [[ MAPPINGS ]] --
local map = vim.keymap.set
local opts = function(description)
	return { noremap = true, silent = true, desc = description or nil }
end

-- [[ MISC ]]
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts())

map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<C-x>", "<cmd>bd<CR>", { desc = "Close buffer" })

-- [[ TOGGLE TERM ]]

map("n", "<leader>tt", ":ToggleTermToggleAll<CR>", opts("Toggle all terminals"))
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opts("Toggle floating terminal"))
map("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", opts("Toggle vertical terminal"))

-- [[ LINE(s) MOVER ]]
map("v", "J", ":m '>+1<CR>gv=gv", opts("Move selected lines down"))
map("v", "K", ":m '<-2<CR>gv=gv", opts("Move selected lines up"))

-- [[ LINE(s) INDENTATION ]]
map("v", ">", ">gv", opts("Indet selected line"))
map("v", "<", "<gv", opts("Outdent selected line"))

-- [[ Windows resize ]]
map("n", "<C-Up>", ":resize +2<CR>", opts("Increase window size"))
map("n", "<C-Down>", ":resize -2<CR>", opts("Decrease window size"))
map("n", "<C-Left>", ":vertical resize -2<CR>", opts("Decrease vertical window size"))
map("n", "<C-Right>", ":vertical resize +2<CR>", opts("Increase vertical window size"))
