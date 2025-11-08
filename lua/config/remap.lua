vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<tab>", "<C-w><C-w>")

vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever (paste over w/o replacing buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left><Left>]])

local _border = "rounded"

local function bordered_hover(_opts)
    _opts = _opts or {}
    return vim.lsp.buf.hover(vim.tbl_deep_extend("force", _opts, {
        border = _border
    }))
end

local function bordered_signature_help(_opts)
    _opts = _opts or {}
    return vim.lsp.buf.signature_help(vim.tbl_deep_extend("force", _opts, {
        border = _border
    }))
end

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = event.buf,
            callback = function()
                local float_opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = 'rounded',
                    source = 'always',
                    prefix = ' ',
                    suffix = ' ',
                    scope = 'cursor',
                }
                vim.diagnostic.open_float(nil, float_opts)
            end
        })
        -- vim.keymap.set('n', 'gh', bordered_hover, opts)
        vim.keymap.set('n', 'K', bordered_hover, opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gq', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<leader>ch', bordered_signature_help, opts)
        vim.keymap.set({ 'n', 'x' }, '<leader>ff', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    end,
})
