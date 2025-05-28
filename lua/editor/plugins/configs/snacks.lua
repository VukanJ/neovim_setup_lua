return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        animate = { enabled = true, duration = 100, easing = "linear", fps = 60 },
        bigfile = { enabled = true },
        explorer = {
            enabled = true,
            replace_netrw = true,
        },
        indent = { enabled = true },
        image = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true, },
        statuscolumn = { enabled = false },
        words = { enabled = true },
    },
}
