vim.pack.add {
		{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
		{ src = "https://github.com/romgrk/barbar.nvim" },
}

local barbar = require("barbar")
barbar.setup({
    animation = true,
    clickable = true,
    icons = {
        filetype = { enabled = true },
        separator = {left = '▎', right = ''},
        buffer_index = true,
        separator_at_end = false,
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
            [vim.diagnostic.severity.WARN] = {enabled = false},
            [vim.diagnostic.severity.INFO] = {enabled = false},
            [vim.diagnostic.severity.HINT] = {enabled = false}
        },
    },
})
