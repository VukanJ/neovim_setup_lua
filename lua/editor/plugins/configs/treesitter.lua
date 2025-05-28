return {
    "nvim-treesitter/nvim-treesitter",
    config = function() 
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            auto_install = true,
            ensure_installed = { 
                "vim",
                "cpp",
                "c",
                "lua",
                "rust",
                "python",
                "bash",
                "json",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "dockerfile",
                "vimdoc",
            },
            
        })
    end,
}
