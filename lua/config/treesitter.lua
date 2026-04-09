vim.pack.add {
		{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
}
treesitter = require("nvim-treesitter")
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
