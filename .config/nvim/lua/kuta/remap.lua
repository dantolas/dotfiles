--Set the leader to start commands
vim.g.mapleader = " "
-- Enter netRw (the file tree)
vim.keymap.set("n", "<leader>ko",vim.cmd.Ex)
--CTRL C should function the same as escape, something with vertical save idk theprimeagem said it
vim.keymap.set("n","<C-c>","<Esc>")
--Remove trailing whitespace
vim.keymap.set('n', '<Leader>rws', [[:%s/\s\+$//e<cr>]])
--Move highlited lines up and down with capital J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--Cursor stays at the start when appending line below to current line
vim.keymap.set("n", "J", "mzJ`z")
--Cursor stays centered when half page jumping and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
--Paste without overwriting current copied buffer
vim.keymap.set("x","<leader>p","\"_dP")
--Paste from system clipboard
vim.keymap.set("n","<leader>p","\"+p")
-- Set buftype to non-empty (e.g. nowrite) to prevent Neovim asking the file has changed question
vim.keymap.set("v","<leader>p","\"+p")
--Copy to system clipboard
vim.keymap.set("n","<leader>y","\"+y")
vim.keymap.set("v","<leader>y","\"+y")
--Delete to void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
--Copy full path to current buffer
vim.keymap.set("n","<leader>cap",":let @+ = expand(\"%:p\")")
--Copy relative path to current buffer
vim.keymap.set("n","<leader>crp",":let @+ = expand(\"%\")")
--No capital Q, it's evil
vim.keymap.set("n","Q","<nop")
--LSP suggestions navigation
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--Find and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--Make current file executable (Linux)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--LSP bindings
vim.api.nvim_create_autocmd('LspAttach',{
    group = kuta,
    callback = function(e)

        local opts = {buffer = e.buf}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})
--Auto completion bindings
-- Bindings can be found in lazy/cmp.lua
