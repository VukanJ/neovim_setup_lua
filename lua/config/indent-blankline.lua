vim.pack.add {
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
}

local ibl = require("ibl")
ibl.setup()
