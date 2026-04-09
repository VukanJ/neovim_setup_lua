vim.pack.add {
    "https://github.com/rafi/awesome-vim-colorschemes",
    "https://github.com/rose-pine/neovim",
    "https://github.com/catppuccin/nvim",
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/ivan-krukov/vim-snakemake",
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/AlexvZyl/nordic.nvim",
    "https://github.com/whatyouhide/vim-gotham",
    "https://github.com/cryptomilk/nightcity.nvim",

    "https://github.com/godlygeek/tabular",
    "https://github.com/mbbill/undotree",

    "https://github.com/tpope/vim-fugitive",
    "https://github.com/mkotha/conflict3",
    "https://github.com/michaeljsmith/vim-indent-object",
    "https://github.com/iamcco/markdown-preview.nvim",
    "https://github.com/ziontee113/icon-picker.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
}


require("icon-picker").setup({
    disable_legacy_commands = true
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'iceberg_dark',
    component_separators = { left = '', right = '/'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'branch', color={fg='cyan'}}, 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
