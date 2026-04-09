vim.pack.add {
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
}

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	pickers = {
		colorscheme = {
			enable_preview = true
		}
	}
})
vim.keymap.set('n', '<C-f>', ':Telescope find_files<CR>', {})
vim.keymap.set('n', '<C-g>', ':Telescope live_grep<CR>', {})
