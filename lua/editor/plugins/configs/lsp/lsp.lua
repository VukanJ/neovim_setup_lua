return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            -- Inform LSP about vim.xyz in .lua files
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
           callback = function(ev)
             -- Buffer local mappings.
             -- See `:help vim.lsp.*` for documentation on any of the below functions
             local opts = { buffer = ev.buf, silent = true }

             -- set keybinds

             opts.desc = "Show LSP references"
             vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
             opts.desc = "Go to declaration"
             vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
             opts.desc = "Show LSP definitions"
             vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
             opts.desc = "Show LSP implementations"
             vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
             opts.desc = "Show LSP type definitions"
             vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

             -- smart rename
             opts.desc = "Smart rename"
             vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

             -- show documentation for what is under cursor
             opts.desc = "Show documentation for what is under cursor"
             vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

             -- opts.desc = "See available code actions"
             -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

             -- opts.desc = "Show buffer diagnostics"
             -- vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

             -- opts.desc = "Show line diagnostics"
             -- vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
             --
             -- opts.desc = "Go to previous diagnostic"
             -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
             --
             -- opts.desc = "Go to next diagnostic"
             -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
           end,
        })

        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = 'single',
                    source = 'always',
                    prefix = ' ',
                    scope = 'cursor',
                }
                vim.diagnostic.open_float(nil, opts)
            end
        })

        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '●',
                    [vim.diagnostic.severity.WARN] = '●',
                },
                linehl = {
                    [vim.diagnostic.severity.ERROR] = 'ErrorMsg'
                },
                numhl = {
                    [vim.diagnostic.severity.WARN] = 'WarningMsg'
                },
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local signs = { Error = "❌", Warn = " ", Hint = "󰌶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        mason_lspconfig.setup({
            automatic_enable = true,
            ensure_installed = {
                "clangd",
                "pyright",
                "html",
                "lua_ls",
            },
            handlers = {
                function(server)
                    lspconfig[server].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig["lua_ls"].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" }, },
                                completion = { callSnippet = "Replace", },
                            },
                        },
                    })
                end,
                ["texlab"] = function()
                    lspconfig["texlab"].setup({
                        autostart = false
                    })
                end,
            },
        })
    end
}
