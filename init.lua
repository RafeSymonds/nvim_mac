-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local format_group = vim.api.nvim_create_augroup("PythonFormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    pattern = "*.py",
    callback = function()
        -- Run Ruff to fix issues before saving
        vim.cmd([[silent! !ruff --fix %]])
    end,
})

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "--header-insertion=never",
        "--log=verbose",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "hpp", "h" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
})

-- change autocomplete to tab instead of enter
-- local cmp = require("cmp")
-- cmp.setup({
--     mapping = {
--         ["<Tab>"] = cmp.mapping.confirm({ select = true }),
--     },
--     sources = {
--         { name = "nvim_lsp" },
--         { name = "buffer" },
--         { name = "path" },
--     },
-- })
--
--
--
--
