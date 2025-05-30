-- Move code in selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't move cursor when using J
vim.keymap.set("n", "J", "mzJ`z")

-- Center view when using N/n
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't clear yank buffer after pasting
vim.keymap.set("x", "p", "\"_dP")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Autoformat
vim.keymap.set("n", "<C-b>", function()
    vim.lsp.buf.format()
end)

-- Rename occurrences visually with s
vim.keymap.set("n", "s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- LLDB Debugger
-- Toggle Breakpoint
vim.keymap.set("n", "<F12>", function() require'dap'.toggle_breakpoint() end)
vim.keymap.set("n", "<F2>", function()
    require'dap'.continue()
    require'dapui'.open()
    vim.opt.cursorline = true
end)
vim.keymap.set("n", "<F5>", function() require'dap'.step_over() end)
vim.keymap.set("n", "<F6>", function() require'dap'.step_into() end)
vim.keymap.set("n", "<F9>", function() require'dap'.continue() end)
vim.keymap.set("n", "<F3>", function()
    require'dap'.close()
    require'dapui'.close()
    vim.opt.cursorline = false
end)
