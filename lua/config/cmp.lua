vim.pack.add {
    "https://github.com/hrsh7th/nvim-cmp", -- Autofill
    {
        src = "https://github.com/L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
    },
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/saadparwaiz1/cmp_luasnip",
    "https://github.com/hrsh7th/cmp-nvim-lsp",  -- LSP support
    "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",  -- Autocompletion function signatures
    "https://github.com/hrsh7th/cmp-buffer",  -- Autocompletion of buffer words
    "https://github.com/hrsh7th/cmp-cmdline",  -- Autocompletion for vim command mode
    "https://github.com/hrsh7th/cmp-path",  -- Autocompletion for vim command mode
    "https://github.com/onsails/lspkind.nvim",
}
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    completion = {
        completeopt = "menu,menuone,preview,noselect",
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
                -- if cmp.visible() then
                --     cmp.select_next_item()
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        ['S-<Tab>'] = cmp.mapping(function(fallback)
                -- if cmp.visible() then
                --     cmp.select_prev_item()
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
    }),
    -- Autocompletion sources
    sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "nvim_lsp_signature_help"},
        { name = "luasnip"},
        { name = "buffer"},
        { name = "path"},
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_chars = "...",
        }),
    },
    window = {
        completion = cmp.config.window.bordered { border = "single", },
        documentation = cmp.config.window.bordered { border = "double" },
    },
})
