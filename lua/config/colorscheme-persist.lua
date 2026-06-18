vim.pack.add {
    "https://github.com/propet/colorscheme-persist.nvim",
}

require("colorscheme-persist").setup()

vim.keymap.set("n", "<leader>sc", function()
    require("colorscheme-persist").picker()
end, { desc = "Choose colorscheme" })
