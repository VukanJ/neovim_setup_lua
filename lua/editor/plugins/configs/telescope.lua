return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function() 
        local telescope = require("telescope")
        telescope.setup({
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        })
    vim.keymap.set('n', '<C-f>', ':Telescope find_files<CR>', {})
    vim.keymap.set('n', '<C-g>', ':Telescope live_grep<CR>', {})
    end,
}
